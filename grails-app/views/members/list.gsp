
<%@ page import="edu.harvard.cscie56.Members" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'members.label', default: 'Members')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-members" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-members" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
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
				<g:each in="${membersInstanceList}" status="i" var="membersInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: membersInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: membersInstance, field: "phone")}</td>
					
						<td>${fieldValue(bean: membersInstance, field: "fullname")}</td>
					
						<td>${fieldValue(bean: membersInstance, field: "gender")}</td>
						<td><g:link action="show" id="${membersInstance.id }">Profile</g:link></td>
						<td><g:link action="edit" id="${membersInstance.id }">Edit Member</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${membersInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
