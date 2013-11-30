package project
import edu.harvard.cscie56.Tithe;
import edu.harvard.cscie56.TithePayment;
import edu.harvard.cscie56.TithePaymentCommand
import grails.transaction.Transactional

@Transactional
class TithePaymentService {

    def tithePayment(Long titheID, String titheYr) {

		def search = Tithe.findByTitheID(titheID)
		
		assert search != null
		def results = TithePayment.findAllByTitheAndTitheYear(search,titheYr)
		return results
    }
	
	def savePayment(TithePaymentCommand cmd){
		println cmd.tithe
		def tithePayment = new TithePayment(tithe: cmd.tithe, titheYear: cmd.titheYear, titheMonth: cmd.titheMonth,
															datePaid: cmd.datePaid, amount:cmd.amount,acceptedBy: cmd.acceptedBy).save(flush: true)
		//tithePayment.save(flush: true)
		assert tithePayment != null
		return tithePayment
	}
}
