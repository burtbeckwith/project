package edu.harvard.cscie56.auth
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.authentication.dao.NullSaltSource
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.util.GrailsNameUtils
@Secured('isFullyAuthenticated()')
class UserController extends grails.plugin.springsecurity.ui.UserController {
	def save() {
		def user = lookupUserClass().newInstance(params)
		if (params.password) {
			String salt = saltSource instanceof NullSaltSource ? null : params.username
			user.password = springSecurityUiService.encodePassword(params.password, salt)
		}
		if (!user.save(flush: true)) {
			render view: 'create', model: [user: user, authorityList: sortedRoles()]
			return
		}

		addRoles(user)
		flash.message = "$user.member.fullname as been added as new User. Username: $user.username"
		redirect action: 'edit', id: user.id
	}
	
	def update() {
		String passwordFieldName = SpringSecurityUtils.securityConfig.userLookup.passwordPropertyName

		def user = findById()
		if (!user) return
		if (!versionCheck('user.label', 'User', user, [user: user])) {
			return
		}

		def oldPassword = user."$passwordFieldName"
		user.properties = params
		if (params.password && !params.password.equals(oldPassword)) {
			String salt = saltSource instanceof NullSaltSource ? null : params.username
			user."$passwordFieldName" = springSecurityUiService.encodePassword(params.password, salt)
		}

		if (!user.save(flush: true)) {
			render view: 'edit', model: buildUserModel(user)
			return
		}

		String usernameFieldName = SpringSecurityUtils.securityConfig.userLookup.usernamePropertyName

		lookupUserRoleClass().removeAll user
		addRoles user
		userCache.removeUserFromCache user[usernameFieldName]
		flash.message = "User $user.member.fullname has been updated Succesfully."
		redirect action: 'edit', id: user.id
	}
}
