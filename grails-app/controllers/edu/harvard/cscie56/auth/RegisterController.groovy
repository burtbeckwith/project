package edu.harvard.cscie56.auth
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
class RegisterController extends grails.plugin.springsecurity.ui.RegisterController {

}
