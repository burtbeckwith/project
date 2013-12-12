package edu.harvard.cscie56



import grails.test.mixin.*
import spock.lang.*

@TestFor(GuestController)
@Mock(Guest)
class GuestControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.guestInstanceList
            model.guestInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.guestInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def guest = new Guest()
            guest.validate()
            controller.save(guest)

        then:"The create view is rendered again with the correct model"
            model.guestInstance!= null
            assert view == 'create'

		when: "The save action is executed with an invalid data"
			def guestInstance = new Guest(gender: 'male',maritalStatus: 'Single',guestStatus: 'New Visitor',ageGroup: '19-28',comments: 'Everything is OK',
							createdBy: 'admin',created: '12/10/2013',name: 'John Doe',address: '67 Webster Sreet',city: 'Pawtucket',state:'MA',zip: '02861', mobilePhone: '347-967-7223',email: 'hkboateng@hotmail.com').save(flush: true)
			
			controller.save(guestInstance)
			assert guestInstance == null
			
		then: 'redirect back to the create page'
		view == 'create'
		assert flash.message == 'default.not.found.message'
		
        when:"The save action is executed with a valid instance"
            response.reset()
			def attend = new Attendance(service: 'Sunday',serviceDate: '11/23/2013',memberNumber: 20,guestNumber: 20,
							childrenNumber: 10,adultsNumber: 20,createdBy: 'Hubert Boateng',created: '11/20/2013')
							
            guest = new Guest(gender: 'male',maritalStatus: 'Single',guestStatus: 'New Visitor',ageGroup: '19-28',comments: 'Everything is OK',
							createdBy: 'admin',created: '12/10/2013',name: 'John Doe',address: '67 Webster Sreet',city: 'Pawtucket',state:'MA',
							zip: '12861',homePhone:'324-896-7452', mobilePhone: '347-967-7223',email: 'hkboateng@hotmail.com',attendance:attend )
			
			guest.save(flush: true)
			assert guest.id == 1
            controller.save(guest)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/guest/index'
            controller.flash.message != null
            Guest.count() == 1
			assert guest.zip == 12861
			assert guest.name == 'John Doe'
			assert guest.state == 'MA' 
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 302 error is returned"
            response.status == 302

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def guest = new Guest(params)
            controller.show(guest)

        then:"A model is populated containing the domain instance"
            model.guestInstance == guest
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 302

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def guest = new Guest(params)
            controller.edit(guest)

        then:"A model is populated containing the domain instance"
            model.guestInstance == guest
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            status == 302

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def guest = new Guest()
            guest.validate()
            controller.update(guest)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.guestInstance == guest

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            guest = new Guest(params).save(flush: true)
            controller.update(guest)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/guest/show/$guest.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            status == 404

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def guest = new Guest(params).save(flush: true)

        then:"It exists"
            Guest.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(guest)

        then:"The instance is deleted"
            Guest.count() == 0
            response.redirectedUrl == '/guest/index'
            flash.message != null
    }
	
}
