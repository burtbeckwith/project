package edu.harvard.cscie56

import org.springframework.dao.DataIntegrityViolationException

import grails.plugin.springsecurity.annotation.Secured
@Secured('ROLE_ADMIN')
class TithePaymentController {

	def tithePaymentService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tithePaymentInstanceList: TithePayment.list(params), tithePaymentInstanceTotal: TithePayment.count()]
    }

    def create() {
        [tithePaymentInstance: new TithePayment(params)]
    }

    def save(TithePaymentCommand cmd) {
	
        def tithePaymentInstance = tithePaymentService.savePayment(cmd)
        if (!tithePaymentInstance) {
			log.warn "Error occured while creating new Tithe Payment."
            render(view: "create", model: [tithePaymentInstance: tithePaymentInstance])
            return
        }
		log.info  " New Tithe Payment has been created successfully: $tithePaymentInstance" 
        flash.message = message(code: 'default.created.message', args: [message(code: 'tithePayment.label', default: 'TithePayment'), tithePaymentInstance.id])
        redirect(action: "show", id: tithePaymentInstance.id)
    }

	def searchTithe(Long titheID, String titheYear){
		def tithePayments = tithePaymentService.tithePayment(titheID, titheYear)
		if(tithePayments == null || !tithePayments){
			log.info "No Tithe Payment was found for $titheID and $titheYear"
			flash.message ="No Tithe Payment was found for Tithe ID: $titheID and Tithe Year:$titheYear"
			redirect(action: 'searchPayments')
			return
		}
		
		render view: 'searchTithePayment', model : [tithePaymentInstanceList: tithePayments , tithePaymentInstanceTotal: TithePayment.count()]
		
	}
	
	def searchPayments(){
		render view: 'searchTithePayment'
	}
    def show(Long id) {
        def tithePaymentInstance = TithePayment.get(id)
        if (!tithePaymentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tithePayment.label', default: 'TithePayment'), id])
            redirect(action: "list")
            return
        }

        [tithePaymentInstance: tithePaymentInstance]
    }
	
	def getTitheId(Long titheID){

		def titheInstance = Tithe.executeQuery("select distinct c from Tithe c where c.titheID = ?", [titheID])
		
		return titheInstance
	}

	def searchTitheID(Long titheID){
		
		def titheInstance = getTitheId(titheID)
		
		if(!titheInstance || titheInstance == null){
			flash.message =" No Tithe ID was found..Try again"
			redirect(action: "create")
			return
		}
		render view: 'create',  model: [titheInstance: titheInstance,titheInstanceID: titheID]
	}
    def edit(Long id) {
        def tithePaymentInstance = TithePayment.get(id)
        if (!tithePaymentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tithePayment.label', default: 'TithePayment'), id])
            redirect(action: "list")
            return
        }

        [tithePaymentInstance: tithePaymentInstance]
    }

    def update(Long id, Long version) {
        def tithePaymentInstance = TithePayment.get(id)
        if (!tithePaymentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tithePayment.label', default: 'TithePayment'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tithePaymentInstance.version > version) {
                tithePaymentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tithePayment.label', default: 'TithePayment')] as Object[],
                          "Another user has updated this TithePayment while you were editing")
                render(view: "edit", model: [tithePaymentInstance: tithePaymentInstance])
                return
            }
        }

        tithePaymentInstance.properties = params

        if (!tithePaymentInstance.save(flush: true)) {
            render(view: "edit", model: [tithePaymentInstance: tithePaymentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tithePayment.label', default: 'TithePayment'), tithePaymentInstance.id])
        redirect(action: "show", id: tithePaymentInstance.id)
    }

    def delete(Long id) {
        def tithePaymentInstance = TithePayment.get(id)
        if (!tithePaymentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tithePayment.label', default: 'TithePayment'), id])
            redirect(action: "list")
            return
        }

        try {
            tithePaymentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tithePayment.label', default: 'TithePayment'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tithePayment.label', default: 'TithePayment'), id])
            redirect(action: "show", id: id)
        }
    }
}
class TithePaymentCommand{
	Long id
	Tithe tithe
	Float amount
	String datePaid
	String titheMonth
	String titheYear
	String acceptedBy
	static constraints = {
	}
	
	static mapping = {
		version false
	}
}