package edu.harvard.cscie56



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PledgeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Pledge.list(params), model:[pledgeInstanceCount: Pledge.count()]
    }

    def show(Pledge pledgeInstance) {
        respond pledgeInstance
    }

    def create() {
        respond new Pledge(params)
    }

    @Transactional
    def save(Pledge pledgeInstance) {
        if (pledgeInstance == null) {
            notFound()
            return
        }

        if (pledgeInstance.hasErrors()) {
            respond pledgeInstance.errors, view:'create'
            return
        }

        pledgeInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'pledgeInstance.label', default: 'Pledge'), pledgeInstance.id])
                redirect pledgeInstance
            }
            '*' { respond pledgeInstance, [status: CREATED] }
        }
    }

    def edit(Pledge pledgeInstance) {
        respond pledgeInstance
    }

    @Transactional
    def update(Pledge pledgeInstance) {
        if (pledgeInstance == null) {
            notFound()
            return
        }

        if (pledgeInstance.hasErrors()) {
            respond pledgeInstance.errors, view:'edit'
            return
        }

        pledgeInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Pledge.label', default: 'Pledge'), pledgeInstance.id])
                redirect pledgeInstance
            }
            '*'{ respond pledgeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Pledge pledgeInstance) {

        if (pledgeInstance == null) {
            notFound()
            return
        }

        pledgeInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Pledge.label', default: 'Pledge'), pledgeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'pledgeInstance.label', default: 'Pledge'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
