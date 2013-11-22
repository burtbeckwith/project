
<%@ page import="edu.harvard.cscie56.Attendance" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'attendance.label', default: 'Attendance')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-attendance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-attendance" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list attendance">
			
				<g:if test="${attendanceInstance?.adultsNumber}">
				<li class="fieldcontain">
					<span id="adultsNumber-label" class="property-label"><g:message code="attendance.adultsNumber.label" default="Adults Number" /></span>
					
						<span class="property-value" aria-labelledby="adultsNumber-label"><g:fieldValue bean="${attendanceInstance}" field="adultsNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendanceInstance?.childrenNumber}">
				<li class="fieldcontain">
					<span id="childrenNumber-label" class="property-label"><g:message code="attendance.childrenNumber.label" default="Children Number" /></span>
					
						<span class="property-value" aria-labelledby="childrenNumber-label"><g:fieldValue bean="${attendanceInstance}" field="childrenNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendanceInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="attendance.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue bean="${attendanceInstance}" field="createdBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendanceInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="attendance.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:fieldValue bean="${attendanceInstance}" field="dateCreated"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendanceInstance?.guestNumber}">
				<li class="fieldcontain">
					<span id="guestNumber-label" class="property-label"><g:message code="attendance.guestNumber.label" default="Guest Number" /></span>
					
						<span class="property-value" aria-labelledby="guestNumber-label"><g:fieldValue bean="${attendanceInstance}" field="guestNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendanceInstance?.memberNumber}">
				<li class="fieldcontain">
					<span id="memberNumber-label" class="property-label"><g:message code="attendance.memberNumber.label" default="Member Number" /></span>
					
						<span class="property-value" aria-labelledby="memberNumber-label"><g:fieldValue bean="${attendanceInstance}" field="memberNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendanceInstance?.service}">
				<li class="fieldcontain">
					<span id="service-label" class="property-label"><g:message code="attendance.service.label" default="Service" /></span>
					
						<span class="property-value" aria-labelledby="service-label"><g:fieldValue bean="${attendanceInstance}" field="service"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendanceInstance?.serviceDate}">
				<li class="fieldcontain">
					<span id="serviceDate-label" class="property-label"><g:message code="attendance.serviceDate.label" default="Service Date" /></span>
					
						<span class="property-value" aria-labelledby="serviceDate-label"><g:fieldValue bean="${attendanceInstance}" field="serviceDate"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${attendanceInstance?.id}" />
					<g:link class="edit" action="edit" id="${attendanceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
