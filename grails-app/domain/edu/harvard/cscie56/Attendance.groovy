package edu.harvard.cscie56

class Attendance {

	String service
	String serviceDate
	Integer memberNumber
	Integer guestNumber
	Integer childrenNumber
	Integer adultsNumber
	String createdBy
	String created
	
    static constraints = {
		
    }
	
	static mapping = {
		version false
		serviceDate column: 'servicedate', index: 'servicedate_Idx'
	}
	
}
