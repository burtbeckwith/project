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
                
				redirect action: 'create'
            }
            '*' { respond membersInstance, [status: CREATED] }
        }
    }
		def searchPhone(MemberCommand cmd){
		
			def memberInstance = memberService.searchByPhone(cmd)
				if(!memberInstance || memberInstance == null){
					flash.message = "No record was found for Phone Number: "+cmd.phone
					redirect(action: 'find')
					return
				}
		
				render (view: 'find', model:[ membersInstance: memberInstance])
			}
			def searchEmail(MemberCommand cmd){
		
				def memberInstance = memberService.searchByEmail(cmd)
				if(!memberInstance || memberInstance == null){
					flash.message = "No record was found for Email Address: "+cmd.email
					redirect(action: 'find')
					return
				}
		
				render (view: 'find', model:[ membersInstance: memberInstance])
			}
			def search(){
				render view: 'search'
			}
			def searchName(MemberCommand cmd){
		
				def memberInstance = memberService.searchMemberName(cmd)
				if(!memberInstance || memberInstance == null){
					flash.message = "No record was found for Full Name: "+cmd.fullname
					redirect(action: 'find')
					return
				}
		
				render (view: 'find', model:[ membersInstance: memberInstance])
			}
		
    def edit(Members membersInstance) {
        respond membersInstance
    }

    @Transactional
    def update(Members membersInstance) {
        if (membersInstance == null) {
            notFound()
            return
        }

        if (membersInstance.hasErrors()) {
            respond membersInstance.errors, view:'edit'
            return
        }

        membersInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Members.label', default: 'Members'), membersInstance.id])
                redirect membersInstance
            }
            '*'{ respond membersInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Members membersInstance) {

        if (membersInstance == null) {
            notFound()
            return
        }

        membersInstance.delete flush:true

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
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
class MemberCommand{
	Long id
	String fullname
	String email
	String phone
	String gender
	String created
	String createdBy
	
	static constraints = {
		email email: true
		phone phoneUS: true
		email: unique: true
		gender inList: ['male','female']
	}
}