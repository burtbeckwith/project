package edu.harvard.cscie56

class Tithe {

	Long titheID
	String member
    static constraints = {
		member unique: true
    }
}
