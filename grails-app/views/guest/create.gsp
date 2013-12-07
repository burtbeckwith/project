<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'guest.label', default: 'Guest')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-guest" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-guest">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${guestInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${guestInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:guestInstance, action:'save']" class="lampstand-form">
					<g:render template="form"/>
												<input type="hidden" name="createdBy" value="<sec:loggedInUserInfo field="id"/>">
							<input type="hidden" name="created" value="<g:formatDate format="MM/dd/yyyy" date="${new Date()}"/>">
	                    <input type="submit" value="Save" />
                 <input type="reset" value="Reset Form">
			</g:form>
		</div>
	</body>
</html>
