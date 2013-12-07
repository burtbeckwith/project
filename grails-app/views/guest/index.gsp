
<%@ page import="edu.harvard.cscie56.Guest" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'guest.label', default: 'Guest')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-guest" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-guest" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'guest.guestStatus.label', default: 'Guest Status')}" />
					
						<g:sortableColumn property="Phone Number" title="${message(code: 'guest.homePhone.label', default: 'Phone Number')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'guest.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'guest.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="guestStatus" title="${message(code: 'guest.address1.label', default: 'Guest Status')}" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${guestInstanceList}" status="i" var="guestInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${guestInstance.id}">${fieldValue(bean: guestInstance, field: "name")}</g:link></td>
					
						<td>C:${fieldValue(bean: guestInstance, field: "mobilePhone")}&nbsp;<br> H:${fieldValue(bean: guestInstance, field: "homePhone")}</td>
					
						<td>${fieldValue(bean: guestInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: guestInstance, field: "address")}&nbsp;<br>${fieldValue(bean: guestInstance, field: "address1")}&nbsp;${fieldValue(bean: guestInstance, field: "city")}&nbsp;${fieldValue(bean: guestInstance, field: "state")}&nbsp;,${fieldValue(bean: guestInstance, field: "zip")}</td>
					
						<td>${fieldValue(bean: guestInstance, field: "guestStatus")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${guestInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
