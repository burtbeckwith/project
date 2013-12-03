package edu.harvard.cscie56.auth
import grails.plugin.springsecurity.annotation.Secured

@Secured('isFullyAuthenticated()')
class RoleController extends grails.plugin.springsecurity.ui.RoleController {
}
