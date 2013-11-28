<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'members.label', default: 'Members')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
	
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${membersInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${membersInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<section class="lampstand-wrapper">
			<g:form url="[resource:membersInstance, action:'save']" class="lampstand-form" >
					<g:render template="form"/>
							<input type="hidden" name="createdBy" value="<sec:loggedInUserInfo field="id"/>">
							<input type="hidden" name="created" value="<g:formatDate format="MM/dd/yyyy" date="${new Date()}"/>">
				
                    <input type="submit" value="Save" />
                 <input type="reset" value="Reset Form">
			</g:form>
</section>
	</body>
</html>
