<%@ page import="edu.harvard.cscie56.Offering" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'offering.label', default: 'Offering')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-offering" class="content scaffold-edit" role="main">
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
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:form url="[resource:offeringInstance, action:'update']" method="PUT" class="lampstand-form">
				<g:hiddenField name="version" value="${offeringInstance?.version}" />
				
					<g:render template="form"/>
					
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				
			</g:form>
			</section>
		</div>
	</body>
</html>
