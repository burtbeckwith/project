<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'attendance.label', default: 'Attendance')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
	<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-attendance" class="content scaffold-create" role="main">
			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${attendanceInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${attendanceInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
				<section class="lampstand-wrapper">
			<g:form url="[resource:attendanceInstance, action:'save']" class="lampstand-form" >
					<g:render template="form"/>
	<input type="hidden" name="created" value="<g:formatDate format="MM/dd/yyyy" date="${new Date()}"/>">
		
		<input type="hidden" name="createdBy"value="<sec:loggedInUserInfo field="username"/>" >
					  <input type="submit" name="create" value="Save" />
				
			</g:form>
			</section>
		</div>
	</body>
</html>
