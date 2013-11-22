package edu.harvard.cscie56

import org.springframework.dao.DataIntegrityViolationException

import grails.plugin.springsecurity.annotation.Secured
@Secured('ROLE_ADMIN')
class PledgeImplController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [pledgeImplInstanceList: PledgeImpl.list(params), pledgeImplInstanceTotal: PledgeImpl.count()]
    }

    def create() {
        [pledgeImplInstance: new PledgeImpl(params)]
    }

    def save() {
        def pledgeImplInstance = new PledgeImpl(params)
        if (!pledgeImplInstance.save(flush: true)) {
            render(view: "create", model: [pledgeImplInstance: pledgeImplInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'pledgeImpl.label', default: 'PledgeImpl'), pledgeImplInstance.id])
        redirect(action: "show", id: pledgeImplInstance.id)
    }

    def show(Long id) {
        def pledgeImplInstance = PledgeImpl.get(id)
        if (!pledgeImplInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pledgeImpl.label', default: 'PledgeImpl'), id])
            redirect(action: "list")
            return
        }

        [pledgeImplInstance: pledgeImplInstance]
    }

    def edit(Long id) {
        def pledgeImplInstance = PledgeImpl.get(id)
        if (!pledgeImplInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pledgeImpl.label', default: 'PledgeImpl'), id])
            redirect(action: "list")
            return
        }

        [pledgeImplInstance: pledgeImplInstance]
    }

    def update(Long id, Long version) {
        def pledgeImplInstance = PledgeImpl.get(id)
        if (!pledgeImplInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pledgeImpl.label', default: 'PledgeImpl'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (pledgeImplInstance.version > version) {
                pledgeImplInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'pledgeImpl.label', default: 'PledgeImpl')] as Object[],
                          "Another user has updated this PledgeImpl while you were editing")
                render(view: "edit", model: [pledgeImplInstance: pledgeImplInstance])
                return
            }
        }

        pledgeImplInstance.properties = params

        if (!pledgeImplInstance.save(flush: true)) {
            render(view: "edit", model: [pledgeImplInstance: pledgeImplInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'pledgeImpl.label', default: 'PledgeImpl'), pledgeImplInstance.id])
        redirect(action: "show", id: pledgeImplInstance.id)
    }

    def delete(Long id) {
        def pledgeImplInstance = PledgeImpl.get(id)
        if (!pledgeImplInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pledgeImpl.label', default: 'PledgeImpl'), id])
            redirect(action: "list")
            return
        }

        try {
            pledgeImplInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'pledgeImpl.label', default: 'PledgeImpl'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pledgeImpl.label', default: 'PledgeImpl'), id])
            redirect(action: "show", id: id)
        }
    }
}
