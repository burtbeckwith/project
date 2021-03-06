package edu.harvard.cscie56



import grails.test.mixin.*
import java.text.SimpleDateFormat
import spock.lang.*

@TestFor(OfferingController)
@Mock(Offering)
class OfferingControllerSpec extends Specification {
	def r = new SimpleDateFormat("MM/dd/yyyy")

/**
 * 
 *     String service
    Float amountCheck
    Float amountCash
    String offeringDate
    String approvedBy
 * @param params
 * @return
 */
    def populateValidParams(params) {
        assert params != null
		def date = r.parse('12/13/2013')
        // TODO: Populate valid properties like...
        params.service = 'Mid-Week Service'
		params.amountCheck = 200
		params.amountcash = 100
		params.offeringdate = date
		params.approvedBy = 'John Doe'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.offeringInstanceList
            model.offeringInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.offeringInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def offering = new Offering()
            offering.validate()
            controller.save(offering)

        then:"The create view is rendered again with the correct model"
            model.offeringInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
			def date = r.parse('11/23/2013')

            offering = new Offering(service:'Mid-Week',amountCash: 200,amountCheck: 100, offeringDate: date, approvedBy: 'John Doe').save(flush: true)
			offering.validate()
            controller.save(offering)
			assert offering.id == 1
        then:"A redirect is issued to the show action"
           
            flash.message != null
            offering.count() == 1
			offering.service != 'Sunday'
			response.redirectedUrl == '/offering/index'
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def offering = new Offering(params)
            controller.show(offering)

        then:"A model is populated containing the domain instance"
            model.offeringInstance == offering
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def offering = new Offering(params)
            controller.edit(offering)

        then:"A model is populated containing the domain instance"
            model.offeringInstance == offering
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 302 error is returned"
            status == 302

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def offering = new Offering()
            offering.validate()
            controller.update(offering)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
			flash.message == null
            model.offeringInstance == offering

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
			params.amountCash = 250
            offering = new Offering(params).save(flush: true)
            controller.update(offering)

        then:"A redirect is issues to the show action"
            //response.redirectedUrl == "/offering/show/$offering"
            flash.message != null
			offering.amountCash == 250
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 302 is returned"
            status == 302

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def offering = new Offering(params).save(flush: true)
			
			controller.save(offering)
        then:"It exists"
            offering.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(offering)

        then:"The instance is deleted"
            Offering.count() == 0
            response.redirectedUrl == '/offering/index'
            flash.message != null
    }
	
	void "Test that an instance is "(){
	
		when: 'When the search method is executed'
		controller.search()
		then : 'Search view is renderd'
		view == '/offering/searchOffering'
		
		when: 'When searchOffering is exeuted with incorrect offering date'
		populateValidParams(params)
		controller.searchOffering('11/20/2013')
		
		then: 'Error message is rendered'
		flash.message == "No Offering was found. Try again."
		view == '/offering/searchOffering'
		
		when: 'When searchOffering is exeuted with incorrect offering date'
		populateValidParams(params)
		def offeringInstance = controller.searchOffering('12/13/2013')
		
		then: 'Error message is rendered'
		//flash.message == "No Offering was found. Try again."
		view == '/offering/searchOffering'
		model.offeringInstance == offeringInstance
		flash.message == "No Offering was found. Try again."
		
	}
	
}
