package project

import edu.harvard.cscie56.Offering
import edu.harvard.cscie56.OfferingCommand
import grails.transaction.Transactional

@Transactional
class OfferingService {

    def saveOffering(OfferingCommand cmd) {
		def offeringInstance = new Offering(service: cmd.service,amountCash:cmd.amountCash,amountCheck:cmd.amountCheck,
									approvedBy:cmd.approvedBy, offeringDate:cmd.offeringDate)
		def offeringI =offeringInstance.save(flush: true)
		
		assert offeringI != null
		return offeringI
    }
	
	def updateOffering(OfferingCommand cmd, Offering offeringInstance){
		cmd.properties['service','amountCash','amountCheck','approvedby','offeringDate'] = offeringInstance.properties
		cmd.save(flush:true)
		
	}
}
