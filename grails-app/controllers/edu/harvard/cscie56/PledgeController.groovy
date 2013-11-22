package edu.harvard.cscie56

import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured
@Secured('ROLE_ADMIN')
class PledgeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [pledgeInstanceList: Pledge.list(params), pledgeInstanceTotal: Pledge.count()]
    }

    def create() {
        [pledgeInstance: new Pledge(params)]
    }

    def save() {
        def pledgeInstance = new Pledge(params)
        if (!pledgeInstance.save(flush: true)) {
            render(view: "create", model: [pledgeInstance: pledgeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'pledge.label', default: 'Pledge'), pledgeInstance.id])
        redirect(action: "show", id: pledgeInstance.id)
    }

    def show(Long id) {
        def pledgeInstance = Pledge.get(id)
        if (!pledgeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pledge.label', default: 'Pledge'), id])
            redirect(action: "list")
            return
        }

        [pledgeInstance: pledgeInstance]
    }

    def edit(Long id) {
        def pledgeInstance = Pledge.get(id)
        if (!pledgeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pledge.label', default: 'Pledge'), id])
            redirect(action: "list")
            return
        }

        [pledgeInstance: pledgeInstance]
    }

    def update(Long id, Long version) {
        def pledgeInstance = Pledge.get(id)
        if (!pledgeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pledge.label', default: 'Pledge'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (pledgeInstance.version > version) {
                pledgeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'pledge.label', default: 'Pledge')] as Object[],
                          "Another user has updated this Pledge while you were editing")
                render(view: "edit", model: [pledgeInstance: pledgeInstance])
                return
            }
        }

        pledgeInstance.properties = params

        if (!pledgeInstance.save(flush: true)) {
            render(view: "edit", model: [pledgeInstance: pledgeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'pledge.label', default: 'Pledge'), pledgeInstance.id])
        redirect(action: "show", id: pledgeInstance.id)
    }

    def delete(Long id) {
        def pledgeInstance = Pledge.get(id)
        if (!pledgeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pledge.label', default: 'Pledge'), id])
            redirect(action: "list")
            return
        }

        try {
            pledgeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'pledge.label', default: 'Pledge'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pledge.label', default: 'Pledge'), id])
            redirect(action: "show", id: id)
        }
    }
}
