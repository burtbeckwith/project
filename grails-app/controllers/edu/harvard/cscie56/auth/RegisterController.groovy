package edu.harvard.cscie56.auth
import edu.harvard.cscie56.Members
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
class RegisterController extends grails.plugin.springsecurity.ui.RegisterController {

	def resetPassword(){
		
	}

}
class RegisterCommand {
	Members member
	String username
	String email
	String password
	String password2

	def grailsApplication

	static constraints = {
		username blank: false, validator: { value, command ->
			if (value) {
				def User = command.grailsApplication.getDomainClass(
					SpringSecurityUtils.securityConfig.userLookup.userDomainClassName).clazz
				if (User.findByUsername(value)) {
					return 'registerCommand.username.unique'
				}
			}
		}
		email blank: false, email: true
		password blank: false, validator: RegisterController.passwordValidator
		password2 validator: RegisterController.password2Validator
	}
}

class ResetPasswordCommand {
	String username
	String password
	String password2

	static constraints = {
		password blank: false, validator: RegisterController.passwordValidator
		password2 validator: RegisterController.password2Validator
	}
}
