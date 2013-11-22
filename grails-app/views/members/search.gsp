<%@ page import="edu.harvard.cscie56.Members" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'members.label', default: 'Members')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>         
              <table>
				<thead>
					<tr>
					
						<g:sortableColumn property="email" title="${message(code: 'members.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="phone" title="${message(code: 'members.phone.label', default: 'Phone')}" />
					
						<g:sortableColumn property="fullname" title="${message(code: 'members.fullname.label', default: 'Fullname')}" />
					
						<g:sortableColumn property="gender" title="${message(code: 'members.gender.label', default: 'Gender')}" />
						<th>Show Profile</th>
						<th>Edit</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${memberInstance}" status="i" var="membersInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: membersInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: membersInstance, field: "phone")}</td>
					
						<td>${fieldValue(bean: membersInstance, field: "fullname")}</td>
					
						<td>${fieldValue(bean: membersInstance, field: "gender")}</td>
						<td><g:link action="show" id="${membersInstance.id }">Profile</g:link></td>
						<td><g:link action="edit" id="${membersInstance.id }">Edit</g:link></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			</body>
			</html>