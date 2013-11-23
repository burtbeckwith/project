package edu.harvard.cscie56
import grails.plugin.springsecurity.annotation.Secured
@Secured('ROLE_ADMIN')
class OfferingController {

	def offeringService
    def index() { }
	
	def create(){
		[offeringInstance : new Offering(params)]
	}
	
	def listOffering(Integer max){
		params.max = Math.min(max ?:10, 100)
		[offeringInstanceList:Offering.list(), offeringInstanceTotal: Offering.count()]
	}
	
	def saveOffering(OfferingCommand cmd){
		def offeringInstance = offeringService.saveOffering
		if(offeringInstance==null || !offeringInstance){
			flash.message = " Error occured while"
			return
		}
		render 'Offering has been save successfully...'
		//redirect(action: 'create')
	}
	
	def updateOffering(OfferingCommand cmd){
		def offeringInstance = Offering.get(cmd.id).lock()
		if(offeringInstance== null || !offeringInstance){
			flash.message = "No Offering was found with ID: "+cmd.id
			return
		}
		def offering = offeringService.updateOffering(cmd, offeringInstance)
		if(!offering|| offering == null){
			flash.message=" Error occured will transaction"
			redirect(action: 'edit', model: [offeringInstance: offeringInstance])
			return
		}
		
		render 'Offering has been updated Successfully'
		return
		
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
