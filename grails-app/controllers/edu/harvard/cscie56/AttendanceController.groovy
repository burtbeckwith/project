package edu.harvard.cscie56

import org.springframework.dao.DataIntegrityViolationException

import grails.plugin.springsecurity.annotation.Secured
@Secured('ROLE_ADMIN')
class AttendanceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [attendanceInstanceList: Attendance.list(params), attendanceInstanceTotal: Attendance.count()]
    }

    def create() {
        [attendanceInstance: new Attendance(params)]
    }

    def save() {
        def attendanceInstance = new Attendance(params)
        if (!attendanceInstance.save(flush: true)) {
            render(view: "create", model: [attendanceInstance: attendanceInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'attendance.label', default: 'Attendance'), attendanceInstance.id])
        redirect(action: "show", id: attendanceInstance.id)
    }

    def show(Long id) {
        def attendanceInstance = Attendance.get(id)
        if (!attendanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'attendance.label', default: 'Attendance'), id])
            redirect(action: "list")
            return
        }

        [attendanceInstance: attendanceInstance]
    }

    def edit(Long id) {
        def attendanceInstance = Attendance.get(id)
        if (!attendanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'attendance.label', default: 'Attendance'), id])
            redirect(action: "list")
            return
        }

        [attendanceInstance: attendanceInstance]
    }

    def update(Long id, Long version) {
        def attendanceInstance = Attendance.get(id)
        if (!attendanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'attendance.label', default: 'Attendance'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (attendanceInstance.version > version) {
                attendanceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'attendance.label', default: 'Attendance')] as Object[],
                          "Another user has updated this Attendance while you were editing")
                render(view: "edit", model: [attendanceInstance: attendanceInstance])
                return
            }
        }

        attendanceInstance.properties = params

        if (!attendanceInstance.save(flush: true)) {
            render(view: "edit", model: [attendanceInstance: attendanceInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'attendance.label', default: 'Attendance'), attendanceInstance.id])
        redirect(action: "show", id: attendanceInstance.id)
    }

    def delete(Long id) {
        def attendanceInstance = Attendance.get(id)
        if (!attendanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'attendance.label', default: 'Attendance'), id])
            redirect(action: "list")
            return
        }

        try {
            attendanceInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'attendance.label', default: 'Attendance'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'attendance.label', default: 'Attendance'), id])
            redirect(action: "show", id: id)
        }
    }
}
