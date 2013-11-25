import edu.harvard.cscie56.Members
import edu.harvard.cscie56.auth.Role 
import edu.harvard.cscie56.auth.User 
import edu.harvard.cscie56.auth.UserRole 
class BootStrap { 
 def init = { 
 def adminRole = Role.findOrSaveByAuthority('ROLE_ADMIN')
 def members = new Members(fullname: 'Hubert Boateng',email:  'hkboateng@gmail.com',phone:'347-967-7223',gender: 'male',
	 							created: '11/01/2012',createdBy: 'Gina Boateng').save()
 if (!User.count()) { 
     def admin = new User(member: members,username: 'admin',
 password: 'password').save() 
 UserRole.create admin, adminRole, true 
 } 
 } 

 }