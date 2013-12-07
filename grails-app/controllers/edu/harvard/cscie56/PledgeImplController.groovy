package edu.harvard.cscie56



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PledgeImplController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PledgeImpl.list(params), model:[pledgeImplInstanceCount: PledgeImpl.count()]
    }

    def show(PledgeImpl pledgeImplInstance) {
        respond pledgeImplInstance
    }

    def create() {
        respond new PledgeImpl(params)
    }

    @Transactional
    def save(PledgeImpl pledgeImplInstance) {
        if (pledgeImplInstance == null) {
            notFound()
            return
        }

        if (pledgeImplInstance.hasErrors()) {
            respond pledgeImplInstance.errors, view:'create'
            return
        }

        pledgeImplInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'pledgeImplInstance.label', default: 'PledgeImpl'), pledgeImplInstance.id])
                redirect pledgeImplInstance
            }
            '*' { respond pledgeImplInstance, [status: CREATED] }
        }
    }

    def edit(PledgeImpl pledgeImplInstance) {
        respond pledgeImplInstance
    }

    @Transactional
    def update(PledgeImpl pledgeImplInstance) {
        if (pledgeImplInstance == null) {
            notFound()
            return
        }

        if (pledgeImplInstance.hasErrors()) {
            respond pledgeImplInstance.errors, view:'edit'
            return
        }

        pledgeImplInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PledgeImpl.label', default: 'PledgeImpl'), pledgeImplInstance.id])
                redirect pledgeImplInstance
            }
            '*'{ respond pledgeImplInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PledgeImpl pledgeImplInstance) {

        if (pledgeImplInstance == null) {
            notFound()
            return
        }

        pledgeImplInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PledgeImpl.label', default: 'PledgeImpl'), pledgeImplInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'pledgeImplInstance.label', default: 'PledgeImpl'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
