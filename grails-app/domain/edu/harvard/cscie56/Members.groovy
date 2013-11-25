package edu.harvard.cscie56

import edu.harvard.cscie56.auth.User

class Members {

	String fullname
	String email
	String phone
	String gender
	String createdBy
	String created
    static constraints = {
		email email: true
		phone phoneUS: true
		gender inList: ['male','female']
    }
}
