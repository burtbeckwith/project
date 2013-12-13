package edu.harvard.cscie56

import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestMixin(GrailsUnitTestMixin)
@TestFor(TitheController)
@Mock([Tithe,Members])
class TitheControllerSpec extends Specification {

    def populateValidParams(params) {
		assert params != null
		// TODO: Populate valid properties like...
		def memberInstance = new Members(fullname: 'Hubert Boateng',email: 'hkboateng@gmail.com',phone: '401-859-6554',gender: 'male')
		params.titheID = 1
		params.member = memberInstance
    }


    void "Test that create view will be rendered"() {
		when: 'A new Tithe ID is to be created'
		controller.create()
		
		then: 'Create view will be rendered'
			view == '/tithe/create'
    }
	
	void "Test the save action correctly persists an instance"(){
		when: 'The save action is executed with null invalid instance'
		def memberInstance = new Members(fullname: 'Hubert Boateng',email: 'hkboateng@gmail.com',phone: '401-859-6554',gender: 'male')
		params.titheID = 1
		params.member = 2
		def titheInstance = new Tithe(params).save()
		assert titheInstance == null
		
		then: 'User is redirected to Create View'
		//response.redirectedUrl == '/tithe/create'
		flash.message == null
		//view == '/tithe/create'
		
		when: 'The save action is executed with valid paramters'
			populateValidParams(params)
			titheInstance = new Tithe(params).save()
			controller.save(titheInstance)
		
		then : 'Check that the tithe instance was saved'
			titheInstance.count() ==1
			titheInstance.member.fullname == 'Hubert Boateng'
			flash.message == 'default.created.message'
			response.redirectedUrl == '/tithe/show/1'
	}
	
	void "Test the update action correctly update"(){
		when:"Update is called for a domain instance that doesn't exist"
		controller.update(3)

		then:"A 302 error is returned"
		response.redirectedUrl == '/tithe/list'
		flash.message


		when: 'the update action is executed'
			response.reset()
			populateValidParams(params)
			params.titheID = 2
			
			def tithesInstance = new Tithe(params).save(flush: true)
			controller.update(tithesInstance.id)
			
		then: ''
		tithesInstance.titheID == 2
		flash.message != null
		response.redirectedUrl == '/tithe/show/1'
	
			
		
	}
	void "Test that the delete action deletes an instance if it exists"() {
		when:"The delete action is called for a domain instance that doesn't exist"
			controller.delete(1000)

		then:"A 302 is returned"
			response.redirectedUrl == '/tithe/list'
			flash.message

		when:"A domain instance is created"
			response.reset()
			populateValidParams(params)
			def tithe = new Tithe(params).save(flush: true)

		then:"It exists"
			tithe.count() == 1

		when:"The domain instance is passed to the delete action"
			controller.delete(tithe.id)

		then:"The instance is deleted"
			tithe.count() == 0
			response.redirectedUrl == '/tithe/list'
			flash.message
	}

}
