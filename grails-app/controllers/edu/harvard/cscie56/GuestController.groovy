package edu.harvard.cscie56



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import edu.harvard.cscie56.Attendance
@Secured('ROLE_ADMIN')
@Transactional()
class GuestController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Guest.list(params), model:[guestInstanceCount: Guest.count()]
    }

    def show(Guest guestInstance) {
        respond guestInstance
    }

    def create() {
        respond new Guest(params)
    }

	def search(){
		render view: 'searchguest'
	}
	def searchGuest(String searchdate,String service){

		def attendanceInstance = Guest.executeQuery("select a from Guest a where a.attendance.serviceDate=? and a.attendance.service=?",[searchdate,service])
		
		if(!attendanceInstance){
			log.warn "No Recored was found for $searchdate"
			flash.message = "No record was found for Service Date: $searchdate"
			return
		}
		//println attendanceInstance
		/**Use the attendanceInstance to to find the guests that where entered for that particular date**/
		/**println attendanceInstance
		def guests = Guest.createCriteria().list{
				eq('attendance',attendanceInstance)
			
		}
		if(!guests == null|| !guests){
			log.warn "No Recored was found for $searchdate"
			flash.message = "No record was found for Service Date: $attendanceInstance"

			return
		}**/
		println attendanceInstance
		log.info "Service Date search was successful."
		render view: 'searchGuest', model: [guestInstanceList: attendanceInstance, guestInstanceCount: attendanceInstance]
	}
	
    @Transactional
    def save(Guest guestInstance) {
        if (guestInstance == null) {
            notFound()
            return
        }

        if (guestInstance.hasErrors()) {
            respond guestInstance.errors, view:'create'
            return
        }

        guestInstance.save flush:true

        request.withFormat {
            form {
				log.info "New Guest <b>$guestInstance.name</b> has been added Successfully."
                flash.message = "New Guest $guestInstance.name has been added Successfully."
                redirect action: 'index'
            }
            '*' { respond guestInstance, [status: CREATED] }
        }
    }

    def edit(Guest guestInstance) {
        respond guestInstance
    }

    @Transactional
    def update(Guest guestInstance) {
        if (guestInstance == null) {
            notFound()
            return
        }

        if (guestInstance.hasErrors()) {
            respond guestInstance.errors, view:'edit'
            return
        }

        guestInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Guest.label', default: 'Guest'), guestInstance.id])
                redirect guestInstance
            }
            '*'{ respond guestInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Guest guestInstance) {

        if (guestInstance == null) {
            notFound()
            return
        }

        guestInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Guest.label', default: 'Guest'), guestInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'guestInstance.label', default: 'Guest'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
