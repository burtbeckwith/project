package edu.harvard.cscie56.auth
import grails.plugin.springsecurity.annotation.Secured

@Secured('isFullyAuthenticated()')
class RoleController extends grails.plugin.springsecurity.ui.RoleController {
	def update() {
		def role = findById()
		if (!role) return
		if (!versionCheck('role.label', 'Role', role, [role: role])) {
			return
		}

		if (!springSecurityService.updateRole(role, params)) {
			render view: 'edit', model: [role: role]
			return
		}

		flash.message = "Role: $role.authority has been updated Succesfully."
		redirect action: 'edit', id: role.id
	}
	
	def save() {
		def role = lookupRoleClass().newInstance(params)
		if (!role.save(flush: true)) {
		 render view: 'create', model: [role: role]
		 return
		}

		flash.message = "Role: $role.authority has been created Succesfully."
		redirect action: 'edit', id: role.id
	}
}
