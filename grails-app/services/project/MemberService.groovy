package project

import edu.harvard.cscie56.MemberCommand
import edu.harvard.cscie56.Members;
import grails.transaction.Transactional

@Transactional
class MemberService {

	def searchMemberName(MemberCommand cmd){
		def memberInstance = Members.findAll {fullname == cmd.fullname}
		return memberInstance
	}
	
	def searchByPhone(MemberCommand cmd){
		def memberInstance = Members.findAll {phone == cmd.phone}
		return memberInstance
	}
	
	def searchByEmail(MemberCommand cmd){
		def memberInstance = Members.findAll {email == cmd.email}
		return memberInstance
	}
}
