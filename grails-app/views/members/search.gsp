<%@ page import="edu.harvard.cscie56.Members" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'members.label', default: 'Members')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>  
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
						<td><g:link action="edit" id="${membersInstance.id }">Edit</g:link></td>
					</tr>
				</g:each>
				</tbody>
			</table>
	</g:if>   
			</body>
			</html>