
<%@ page import="edu.harvard.cscie56.Attendance" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'attendance.label', default: 'Attendance')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-attendance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create" controller="guest">Add Guests to Attendance</g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-attendance" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="service" title="${message(code: 'attendance.adultsNumber.label', default: 'Service Name')}" />
					
						<g:sortableColumn property="serviceDate" title="${message(code: 'attendance.childrenNumber.label', default: 'Service Date')}" />
					
						<g:sortableColumn property="memberNumber" title="${message(code: 'attendance.memberNumber.label', default: 'Member Number')}"  />
					
						<g:sortableColumn property="guestNumber" title="${message(code: 'attendance.guestNumber.label', default: 'Guest Number')}" />
						<th>Show</th>
						<th>Edit</th>
						<th>Add Guest Info</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${attendanceInstanceList}" status="i" var="attendanceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: attendanceInstance, field: "service")}</td>
					
						<td>${fieldValue(bean: attendanceInstance, field: "serviceDate")}</td>
					
						<td>${fieldValue(bean: attendanceInstance, field: "memberNumber")}</td>
					
						<td>${fieldValue(bean: attendanceInstance, field: "guestNumber")}</td>
					
						<td><g:link action="show" id="${attendanceInstance.id}">Show</g:link></td>
						<td><g:link action="edit" id="${attendanceInstance.id}">Edit</g:link></td>
						<td><g:link action="addGuest" id="${attendanceInstance.id}">Add Guest</g:link></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${attendanceInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
