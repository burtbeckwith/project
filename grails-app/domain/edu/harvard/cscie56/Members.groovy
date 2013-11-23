package edu.harvard.cscie56

class Members {

	String fullname
	String email
	String phone
	String gender
	String dateCreated
	String createdBy
	
    static constraints = {
		email email: true
		phone phoneUS: true
		email: unique: true
		gender inList: ['male','female']
    }
}
