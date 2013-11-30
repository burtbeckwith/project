<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'offering.label', default: 'Offering')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-offering" class="content scaffold-create" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${offeringInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${offeringInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<section class="lampstand-wrapper">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:form url="[resource:offeringInstance, action:'save']" class="lampstand-form">
					<g:render template="form"/>

					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />

			</g:form>
			</section>
		</div>
	</body>
</html>
