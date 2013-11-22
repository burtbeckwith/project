package edu.harvard.cscie56

import org.springframework.dao.DataIntegrityViolationException

class MembersController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [membersInstanceList: Members.list(params), membersInstanceTotal: Members.count()]
    }

    def create() {
        [membersInstance: new Members(params)]
    }

    def save() {
        def membersInstance = new Members(params)
        if (!membersInstance.save(flush: true)) {
            render(view: "create", model: [membersInstance: membersInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'members.label', default: 'Members'), membersInstance.id])
        redirect(action: "show", id: membersInstance.id)
    }

    def show(Long id) {
        def membersInstance = Members.get(id)
        if (!membersInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'members.label', default: 'Members'), id])
            redirect(action: "list")
            return
        }

        [membersInstance: membersInstance]
    }

    def edit(Long id) {
        def membersInstance = Members.get(id)
        if (!membersInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'members.label', default: 'Members'), id])
            redirect(action: "list")
            return
        }

        [membersInstance: membersInstance]
    }

    def update(Long id, Long version) {
        def membersInstance = Members.get(id)
        if (!membersInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'members.label', default: 'Members'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (membersInstance.version > version) {
                membersInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'members.label', default: 'Members')] as Object[],
                          "Another user has updated this Members while you were editing")
                render(view: "edit", model: [membersInstance: membersInstance])
                return
            }
        }

        membersInstance.properties = params

        if (!membersInstance.save(flush: true)) {
            render(view: "edit", model: [membersInstance: membersInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'members.label', default: 'Members'), membersInstance.id])
        redirect(action: "show", id: membersInstance.id)
    }

    def delete(Long id) {
        def membersInstance = Members.get(id)
        if (!membersInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'members.label', default: 'Members'), id])
            redirect(action: "list")
            return
        }

        try {
            membersInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'members.label', default: 'Members'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'members.label', default: 'Members'), id])
            redirect(action: "show", id: id)
        }
    }
}
