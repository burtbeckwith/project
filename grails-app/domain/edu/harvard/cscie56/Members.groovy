package edu.harvard.cscie56

class Members {

	String fullname
	String email
	String phone
	String gender
    static constraints = {
		email email: true
		phone phoneUS: true
		email: unique: true
    }
}
