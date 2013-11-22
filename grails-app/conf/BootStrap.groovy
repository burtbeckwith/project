import edu.harvard.cscie56.auth.Role 
import edu.harvard.cscie56.auth.User 
import edu.harvard.cscie56.auth.UserRole 
class BootStrap { 
 def init = { 
 def adminRole = Role.findOrSaveByAuthority('ROLE_ADMIN') 
 if (!User.count()) { 
     def admin = new User(username: 'admin',
 password: 'password').save() 
 UserRole.create admin, adminRole, true 
 } 
 } 

 }