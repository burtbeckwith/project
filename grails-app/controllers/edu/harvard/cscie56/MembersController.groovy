package edu.harvard.cscie56



import static org.springframework.http.HttpStatus.*
import edu.harvard.cscie56.auth.User
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class MembersController {

	def memberService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Members.list(params), model:[membersInstanceCount: Members.count()]
    }

    def show(Members membersInstance) {
        respond membersInstance
    }

    def create() {
        respond new Members(params)
    }

	def find(){
		render view: 'find'
	}
    @Transactional
    def save(Members membersInstance) {
        if (membersInstance == null) {
            notFound()
            return
        }

        if (membersInstance.hasErrors()) {
            respond cmd.errors, view:'create'
            return
        }

		//def membersInstance = memberService.save(cmd)
		membersInstance.save flush:true

        request.withFormat {
            form {
                flash.message = 'New Member has been created successfully'
                
				redirect view: 'create'
            }
            '*' { respond membersInstance, [status: CREATED] }
        }
    }
	def searchPhone(String phone){
		
			def memberInstance = Members.findByPhone(phone)
				if(!memberInstance || memberInstance == null){
					flash.message = "No record was found for Phone Number $phone"
					redirect(action: 'find')
					return
				}
		
				render (view: 'find', model:[ membersInstance: memberInstance])
			}
			def searchEmail(String emailAddress){
		
				def memberInstance = Members.findByEmail(emailAddress)
				if(!memberInstance || memberInstance == null){
					flash.message = "No record was found for Email Address: $emailAddress"
					redirect(action: 'find')
					return
				}
		
				render (view: 'find', model:[ membersInstance: memberInstance])
			}
			def search(){
				render view: 'search'
			}
			def searchName(String fullname){
		
				def memberInstance = Members.findByFullname(fullname)
				if(!memberInstance || memberInstance == null){
					flash.message = "No record was found for Full Name $fullname"
					redirect(action: 'find')
					return
				}
		
				render (view: 'find', model:[ membersInstance: memberInstance])
			}
		
    def edit(Members membersInstance) {
        respond membersInstance
    }

    @Transactional
    def update(Long id, Long version) {
		def membersInstance = Members.get(id)
        if (!membersInstance || membersInstance == null) {
			flash.message = "No Member was found. Try again"
            render view : 'edit'
            return
        }
        if (membersInstance.hasErrors()) {
            respond membersInstance.errors, view:'edit'
            return
        }
		
		membersInstance.properties = params

		if(!membersInstance.save(flush:true)){
			flash.message = "An Error occured while process your request. Contact your Admin or you can try gain later"
			return
		}
		flash.message = "Members Information has been updated Successfully."
		redirect (action: 'show', model: [membersInstance: membersInstance])
       
    }


	

    @Transactional
    def delete(Members membersInstance) {

        if (membersInstance == null) {
            notFound()
            return
        }
		

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Members.label', default: 'Members'), membersInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'membersInstance.label', default: 'Members'), params.id])
                redirect view: "create", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
