package edu.harvard.cscie56



import grails.test.mixin.*
import spock.lang.*

@TestFor(MembersController)
@Mock(Members)
class MembersControllerSpec extends Specification {

	

	def populateValidParams(params) {
		assert params != null
		params.fullname='Hubert Boateng'
		params.email='hkboateng@gmail.com'
		params.phone= '347-967-3456'
		params.gender= 'male'
		params.createdBy= 'Philip Amoako'
		params.created='11/23/2013'
	}

	def populateValues(){
		def members = new Members(fullname:'Hubert Boateng',email:'hkboateng@gmail.com',phone: '347-967-3456',gender: 0,
			createdBy: 'Philip Amoako',created:'11/23/2013').save(flush: true)
			controller.save(members)
			assert members != null
		return members
	}
    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.membersInstanceList
            model.membersInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.membersInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def members = new Members().save(true)
            controller.save(members)

        then:"The create view is rendered again with the correct model"
            assert model.membersInstance == null
			controller.flash.message == 'default.not.found.message'
            response.redirectUrl == '/members/index'

        when:"The save action is executed with a valid instance"
            response.reset()
			populateValidParams(params)
            members = new Members(params).save()

            controller.save(members)

        then:"A redirect is issued to the index action"
            response.redirectedUrl == '/members/index'
            controller.flash.message != null
            Members.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
		populateValidParams(params)
		def members = new Members(params).save(flush:true)
			
			assert !members.hasErrors()
            controller.show(members)
			assert members != null
			assert members.fullname == 'Hubert Boateng'
			assert members.email == 'hkboateng@gmail.com'
			
        then:"A model is populated containing the domain instance"
            model.membersInstance == members
			assert members.id == 1
    }



    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
		controller.update(4,2)
			
        then:"A 302 error is returned"
			view == '/members/edit'
			flash.message =='No Member was found. Try again'

			when:"An invalid domain instance is passed to the update action"
			response.reset()

			populateValidParams(params)
			def memberInstance = new Members(fullname:'Hubert Boateng',email:'',phone: '347-967-3456',gender: 0,
			createdBy: 'Philip Amoako',created:'11/23/2013')
			memberInstance.save()

			//params.email = ''
			assert memberInstance.hasErrors() == true
			controller.update(memberInstance.id, memberInstance.version)

		then:"The edit view is rendered again with the invalid instance"
			view == '/members/edit'
			



        when:"A valid domain instance is passed to the update action"
            response.reset()
            memberInstance = new Members(params).save(flush: true)
			memberInstance.id == 1
            controller.update(memberInstance.id,memberInstance.version)
			
        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/members/show"
            flash.message != null
			
    }
	
	void "Test that find view is rendered when the method"(){
		when: 'The find button is clicked'
		controller.find()
		
		then: 'The view rendered is find'
		assert view == '/members/find'
	}
	
	void "Test Search Phone method"(){
		given:
		populateValidParams(params)
		def members = new Members(params).save()
		when: 'Search Phone is called with incorrect parameter'
		controller.searchPhone('347-967-8569')
	
		then: 'Renders error message and redirect to the find page'
		response.redirectedUrl == '/members/find'
		flash.message == "No record was found for Phone Number 347-967-8569"
		
		when: 'Search Phone is called with correct parameter'
		controller.searchPhone('347-967-3456')
	
		then: 'Redirects to teh Find view with the memberInstance'
		assert response.redirectUrl == '/members/find'
		model.membersInstance == members
	}
	
	void "Test Search Email method"(){
		given:
		populateValidParams(params)
		def members = new Members(params).save()
		when: 'Search Email is called with incorrect parameter'
		controller.searchEmail('hkboatengdgd')
	
		then: 'Renders error message and redirect to the find page'
		response.redirectedUrl == '/members/find'
		flash.message == "No record was found for Email Address: hkboatengdgd"
		
		when: 'Search Phone is called with correct parameter'
		controller.searchEmail('hkboateng@gmail.com')
	
		then: 'Redirects to teh Find view with the memberInstance'
		assert response.redirectUrl == '/members/find'
		model.membersInstance == members
	}
	void "Test Search Name method"(){
		given:
		populateValidParams(params)
		def members = new Members(params).save()
		when: 'Search Email is called with incorrect parameter'
		controller.searchName('John Foo')
	
		then: 'Renders error message and redirect to the find page'
		response.redirectedUrl == '/members/find'
		flash.message == "No record was found for Full Name John Foo"
		
		when: 'Search Phone is called with correct parameter'
		controller.searchName('Hubert Boateng')
	
		then: 'Redirects to teh Find view with the memberInstance'
		assert response.redirectUrl == '/members/find'
		model.membersInstance == members
	}
/***
    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            status == 302

        when:"A domain instance is created"
            response.reset()
            //populateValidParams(params)
            def members = new Members(params).save()
			assert members != null
			controller.save(members)
        then:"It exists"
            Members.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(members)

        then:"The instance is deleted"
            Members.count() == 0
            response.redirectedUrl == '/members/index'
            flash.message != null
    }****/
}
