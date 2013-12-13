package edu.harvard.cscie56

import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import java.text.SimpleDateFormat
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestFor(TithePaymentController)
@Mock([TithePayment])
class TithePaymentControllerSpec extends Specification {
	def r = new SimpleDateFormat("MM/dd/yyyy")
	
	def populateValidParams(params) {
		def date = r.parse('12/20/2013')
		assert params != null

		params.tithe = 'foo'
		params.amount = 100
		params.datePaid = date
		params.titheMonth = 'June'
		params.titheYear = '2013'
	}

	void "Test the index action correctly redirects"() {

		when:"The index action is executed"
			controller.index()

		then:"The model is correct"
			response.redirectedUrl == '/tithepayment/list'
	}

	void "Test the list action returns the correct model"() {

		when:"The list action is executed"
			def model = controller.list()

		then:"The model is correct"
			!model.tithePaymentInstanceList
			model.tithePaymentInstanceTotal == 0
	}

	void "Test the create action returns the correct model"() {
		when:"The create action is executed"
			def model = controller.create()

		then:"The model is correctly created"
			model.tithePaymentInstance
	}

	void "Test the save action correctly persists an instance"() {

		when:"The save action is executed with an invalid instance"
			def tithePayment = new TithePayment()
			tithePayment .validate()
			controller.save()

		then:"The create view is rendered again with the correct model"
			model.tithePaymentInstance
			view == '/person/create'

		when:"The save action is executed with a valid instance"
			response.reset()
			populateValidParams(params)
			tithePayment  = new TithePayment(params)

			controller.save()

		then:"A redirect is issued to the show action"
			response.redirectedUrl == '/tithePayment /show/1'
			controller.flash.message
			tithePayment.count() == 1
	}

	void "Test that the show action returns the correct model"() {
		when:"The show action is executed with an invalid id"
			controller.show(1000)

		then:"A 302 error is returned"
			response.status == 302

		when:"A domain instance is passed to the show action"
			populateValidParams(params)
			def tithePayment  = new TithePayment(params)
			tithePayment .save()
			def model = controller.show(tithePayment .id)

		then:"A model is populated containing the domain instance"
			model.tithePayment Instance == tithePayment 
	}

	void "Test that the edit action returns the correct model"() {
		when:"The edit action is executed with an invalid id"
			controller.edit(1000)

		then:"A 302 error is returned"
			response.status == 302

		when:"A domain instance is passed to the edit action"
			populateValidParams(params)
			def tithePayment  = new TithePayment(params)
			tithePayment .save()
			def model = controller.edit(tithePayment.id)

		then:"A model is populated containing the domain instance"
			model.tithePaymentInstance == tithePayment
	}

	void "Test the update action performs an update on a valid domain instance"() {
		when:"Update is called for a domain instance that doesn't exist"
			controller.update(1000, 5)

		then:"A 302 error is returned"
			response.redirectedUrl == '/person/list'
			flash.message

		when:"An invalid domain instance is passed to the update action"
			response.reset()

			populateValidParams(params)
			def tithePayment  = new TithePayment(params)
			tithePayment .save()

			params.titheMonth = 'August'

			controller.update(tithePayment .id, tithePayment .version)

		then:"The edit view is rendered again with the invalid instance"
			view == '/person/edit'
			model.tithePayment Instance == tithePayment 

		when:"A valid domain instance is passed to the update action"
			response.reset()
			populateValidParams(params)
			tithePayment  = new TithePayment(params).save(flush: true)
			controller.update(tithePayment.id, tithePayment.version)

		then:"A redirect is issues to the show action"
			response.redirectedUrl == "/tithePayment /show/$tithePayment .id"
			flash.message
	}

	void "Test that the delete action deletes an instance if it exists"() {
		when:"The delete action is called for a domain instance that doesn't exist"
			controller.delete(1000)

		then:"A 302 is returned"
			response.redirectedUrl == '/tithePayment/list'
			flash.message

		when:"A domain instance is created"
			response.reset()
			populateValidParams(params)
			def person = new TithePayment(params).save(flush: true)

		then:"It exists"
			tithePayment.count() == 1

		when:"The domain instance is passed to the delete action"
			controller.delete(person.id)

		then:"The instance is deleted"
			tithePayment.count() == 0
			response.redirectedUrl == '/tithePayment /list'
			flash.message
	}

}
