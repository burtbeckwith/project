package edu.harvard.cscie56

class PledgePayment {
	PledgeImpl impl
	Double amountPaid
	Date paymentDate
	
	String created
	String createdBy
	String modifiedBy
	
	static mapping = {
		version false
	}
}
