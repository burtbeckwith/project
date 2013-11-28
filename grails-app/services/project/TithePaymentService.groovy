package project
import edu.harvard.cscie56.Tithe;
import edu.harvard.cscie56.TithePayment;
import edu.harvard.cscie56.TithePaymentCommand
import grails.transaction.Transactional

@Transactional
class TithePaymentService {

    def tithePayment(Long tithe, String titheYr) {

		def s = Tithe.{titheID == tithe}
		def r = TithePayment.findByTitheAndTitheYear(s,titheYr)
		return s
    }
	
	def savePayment(TithePaymentCommand cmd){
		def tithePayment = new TithePayment(tithe: cmd.tithe, titheYear: cmd.titheYear, titheMonth: cmd.titheMonth,
															datePaid: cmd.datePaid, amount:cmd.amount,acceptedBy: cmd.acceptedBy)
		tithePayment.save(flush: true)
		return tithePayment
	}
}
