package edu.harvard.cscie56

class Guest {
	String comments
	String ageGroup
	String gender
	String maritalStatus
	String guestStatus
	String createdBy
	String created
	String name
	String address
	String address1
	String city
	String state
	Long zip
	String homePhone
	String mobilePhone 
	String email
	Attendance attendance

    static constraints = {
		homePhone phoneUS:true
		mobilePhone phoneUS:true
		email email:true
		address1 nullable: true
		homePhone nullable: true
		
		
    }
	
	static mapping = {
		version false
		cache true
	}
	
}
