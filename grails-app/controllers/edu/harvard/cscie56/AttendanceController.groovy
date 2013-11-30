package edu.harvard.cscie56



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class AttendanceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Attendance.list(params), model:[attendanceInstanceCount: Attendance.count()]
    }

    def show(Attendance attendanceInstance) {
        respond attendanceInstance
    }

    def create() {
        respond new Attendance(params)
    }

    @Transactional
    def save(Attendance attendanceInstance) {
        if (attendanceInstance == null) {
            notFound()
            return
        }

        if (attendanceInstance.hasErrors()) {
            respond attendanceInstance.errors, view:'create'
            return
        }

        attendanceInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'attendanceInstance.label', default: 'Attendance'), attendanceInstance.id])
                redirect action: 'index', method: 'GET'
            }
            '*' { respond attendanceInstance, [status: CREATED] }
        }
    }

    def edit(Attendance attendanceInstance) {
        respond attendanceInstance
    }

    @Transactional
    def update(Attendance attendanceInstance) {
        if (attendanceInstance == null) {
            notFound()
            return
        }

        if (attendanceInstance.hasErrors()) {
            respond attendanceInstance.errors, view:'edit'
            return
        }

        attendanceInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Attendance.label', default: 'Attendance'), attendanceInstance.id])
                redirect action: 'index', method: 'GET'
            }
            '*'{ respond attendanceInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Attendance attendanceInstance) {

        if (attendanceInstance == null) {
            notFound()
            return
        }

        attendanceInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Attendance.label', default: 'Attendance'), attendanceInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'attendanceInstance.label', default: 'Attendance'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
