<html>
<head>
<meta name="layout" content="main"/>
<title>Search Member - Church Management System</title>
</head>
<body>
<div class="container">
	<g:if test="${flash.message }">
	<div class="message">${flash.message }</div>
	</g:if>
       <div id="search-member-container">
      				
                     <fieldset>
                     <legend><input type="radio" name="member-search-option" id="by-name" checked value="member_name">Search Member By Name &nbsp;<input type="radio" name="member-search-option" id="by-phone" value="member_phone">By Phone Number: &nbsp;
                     <input type="radio" name="member-search-option" id="by-email" value="member_email">Email Address:&nbsp;
                     </legend>
                     
                     <div id="member_name" class="src">
                     <g:form action="searchName">
                     Full Name:<input type="text" id="srcFirstName" name="fullname" autocomplete="off">
                     <input type="submit" value="Search Member" id="btnSearchMemberName">
                     </g:form>
                     </div>
                     <g:form action="searchPhone">
                     <div id="member_phone" class="src">
                     <label>Phone Number:&nbsp;</label><input type="text" id="srcPhone" name="phone" placeholder="Format: XXX-XXX-XXXX">
                     <input type="submit" value="Search Member" id="btnSearchphone">
                     </g:form>
                     </div>
                     <div id="member_email">
                     <g:form action="searchEmail">
                     Email Address:<input type="text" id="srcTitheID" name="email" >
                     <input type="submit" value="Search Member" id="btnSearchtitheid">
                     </g:form>
                     </div>
                     </fieldset>
                    
              </div>
				<g:if test="${membersInstance}">
   
              <table>
				<thead>
					<tr>
					
						<g:sortableColumn property="email" title="Full Name" />
					
						<g:sortableColumn property="phone" title="Email Address" />
					
						<g:sortableColumn property="fullname" title="Phone" />
					
						<g:sortableColumn property="gender" title="Gender" />
						<th>Show Profile</th>
						<th>Edit</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${membersInstance}" status="i" var="memberInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${memberInstance?.fullname?.encodeAsHTML()}</td>
					
						<td>${memberInstance?.email?.encodeAsHTML()}</td>
					
						<td>${memberInstance?.phone?.encodeAsHTML()}</td>
					
						<td>${memberInstance?.gender?.encodeAsHTML()}</td>
						<td><g:link action="show" id="${memberInstance.id }">Profile</g:link></td>
						<td><g:link action="edit" id="${memberInstance.id }">Edit</g:link></td>
					</tr>
				</g:each>
				</tbody>
			</table>
	</g:if>   
       </div>
<script>
 
$(document).ready(function() {
    //This will check the status of radio button onload
              $("#member_name").show();
              $("#member_email").hide();
              $("#member_phone").hide();
 
    //This will check the status of radio button onclick
    $("#by-name").click(function() {
              $("#member_name").show();
              $("#member_email").hide();
              $("#member_phone").hide();
   
    });
        $("#by-email").click(function() {
              $("#member_name").hide();
              $("#member_email").show();
              $("#member_phone").hide();
   
    });
    $("#by-phone").click(function() {
              $("#member_name").hide();
              $("#member_email").hide();
              $("#member_phone").show();
   
    });
});
 
</script>
  </body>
</body>
</html>