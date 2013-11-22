package edu.harvard.cscie56

import org.springframework.dao.DataIntegrityViolationException

import grails.plugin.springsecurity.annotation.Secured
@Secured('ROLE_ADMIN')
class TitheController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [titheInstanceList: Tithe.list(params), titheInstanceTotal: Tithe.count()]
    }

    def create() {
        [titheInstance: new Tithe(params)]
    }

    def save() {
        def titheInstance = new Tithe(params)
        if (!titheInstance.save(flush: true)) {
            render(view: "create", model: [titheInstance: titheInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tithe.label', default: 'Tithe'), titheInstance.id])
        redirect(action: "show", id: titheInstance.id)
    }

    def show(Long id) {
        def titheInstance = Tithe.get(id)
        if (!titheInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tithe.label', default: 'Tithe'), id])
            redirect(action: "list")
            return
        }

        [titheInstance: titheInstance]
    }

    def edit(Long id) {
        def titheInstance = Tithe.get(id)
        if (!titheInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tithe.label', default: 'Tithe'), id])
            redirect(action: "list")
            return
        }

        [titheInstance: titheInstance]
    }

    def update(Long id, Long version) {
        def titheInstance = Tithe.get(id)
        if (!titheInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tithe.label', default: 'Tithe'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (titheInstance.version > version) {
                titheInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tithe.label', default: 'Tithe')] as Object[],
                          "Another user has updated this Tithe while you were editing")
                render(view: "edit", model: [titheInstance: titheInstance])
                return
            }
        }

        titheInstance.properties = params

        if (!titheInstance.save(flush: true)) {
            render(view: "edit", model: [titheInstance: titheInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tithe.label', default: 'Tithe'), titheInstance.id])
        redirect(action: "show", id: titheInstance.id)
    }

    def delete(Long id) {
        def titheInstance = Tithe.get(id)
        if (!titheInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tithe.label', default: 'Tithe'), id])
            redirect(action: "list")
            return
        }

        try {
            titheInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tithe.label', default: 'Tithe'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tithe.label', default: 'Tithe'), id])
            redirect(action: "show", id: id)
        }
    }
}
