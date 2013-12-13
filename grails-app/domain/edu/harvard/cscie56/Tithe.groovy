package edu.harvard.cscie56

class Tithe {

	Long titheID
	Members member
    static constraints = {
		member unique: true
    }
}
