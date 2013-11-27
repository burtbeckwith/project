
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
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
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
					
						<g:sortableColumn property="adultsNumber" title="${message(code: 'attendance.adultsNumber.label', default: 'Adults Number')}" />
					
						<g:sortableColumn property="childrenNumber" title="${message(code: 'attendance.childrenNumber.label', default: 'Children Number')}" />
					
						<g:sortableColumn property="created" title="${message(code: 'attendance.created.label', default: 'Created')}" />
					
						<g:sortableColumn property="createdBy" title="${message(code: 'attendance.createdBy.label', default: 'Created By')}" />
					
						<g:sortableColumn property="guestNumber" title="${message(code: 'attendance.guestNumber.label', default: 'Guest Number')}" />
					
						<g:sortableColumn property="memberNumber" title="${message(code: 'attendance.memberNumber.label', default: 'Member Number')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${attendanceInstanceList}" status="i" var="attendanceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${attendanceInstance.id}">${fieldValue(bean: attendanceInstance, field: "adultsNumber")}</g:link></td>
					
						<td>${fieldValue(bean: attendanceInstance, field: "childrenNumber")}</td>
					
						<td>${fieldValue(bean: attendanceInstance, field: "created")}</td>
					
						<td>${fieldValue(bean: attendanceInstance, field: "createdBy")}</td>
					
						<td>${fieldValue(bean: attendanceInstance, field: "guestNumber")}</td>
					
						<td>${fieldValue(bean: attendanceInstance, field: "memberNumber")}</td>
					
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