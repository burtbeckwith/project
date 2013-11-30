package edu.harvard.cscie56



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class OfferingController {

	def offeringService
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

	def search(){
		render view: 'searchOffering' 
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
                redirect action: 'index', method: 'GET'
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
                redirect action: 'index', method: 'GET'
            }
            '*'{ respond offeringInstance, [status: OK] }
        }
    }
	@Transactional
	def searchOffering(String offeringDate){
		if(offeringDate == null){
			notFound()
			return
		}
		def offeringInstance = offeringService.searchOffering(offeringDate)
		if (!offeringInstance || offeringInstance == null){
			flash.message = " No Offering was found. Try again."
			return
		}
		log.info "Offering was found successfully for date: $offeringDate"
		render view: 'searchOffering', model : [offeringInstanceList: offeringInstance]
		
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
                flash.message = "No Offering was found. Try again"
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
class OfferingCommand{
	Long id
	String service
	Float amountCheck
	Float amountCash
	String offeringDate
	String approvedBy
	
	static constraints = {
	}
	static mapping = {
		version false
	}
}