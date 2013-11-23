package edu.harvard.cscie56



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class OfferingController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Offering.list(params), model:[offeringInstanceCount: Offering.count()]
    }

    def show(Offering offeringInstance) {
        respond offeringInstance
    }

    def create() {
        respond new Offering(params)
    }

    @Transactional
    def save(Offering offeringInstance) {
        if (offeringInstance == null) {
            notFound()
            return
        }

        if (offeringInstance.hasErrors()) {
            respond offeringInstance.errors, view:'create'
            return
        }

        offeringInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'offeringInstance.label', default: 'Offering'), offeringInstance.id])
                redirect offeringInstance
            }
            '*' { respond offeringInstance, [status: CREATED] }
        }
    }

    def edit(Offering offeringInstance) {
        respond offeringInstance
    }

    @Transactional
    def update(Offering offeringInstance) {
        if (offeringInstance == null) {
            notFound()
            return
        }

        if (offeringInstance.hasErrors()) {
            respond offeringInstance.errors, view:'edit'
            return
        }

        offeringInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Offering.label', default: 'Offering'), offeringInstance.id])
                redirect offeringInstance
            }
            '*'{ respond offeringInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Offering offeringInstance) {

        if (offeringInstance == null) {
            notFound()
            return
        }

        offeringInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Offering.label', default: 'Offering'), offeringInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'offeringInstance.label', default: 'Offering'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
