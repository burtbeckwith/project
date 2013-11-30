package edu.harvard.cscie56

class PledgeImpl {
	Members member
	Pledge pledge
	Integer amount
	
	String created
	String createdBy
	String modifiedBy
	
	static constraints = {
	}
	
	static mapping = {
		version false
	}
}
