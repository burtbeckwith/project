package edu.harvard.cscie56

class PledgeImpl {
	Members member
	Pledge pledge
	Double amount //Amount Church Member or Guest pledged
	
	String created
	String createdBy
	String modifiedBy
	
	static constraints = {
		member nullable: false
	}
	
	static mapping = {
		version false
	}
}
