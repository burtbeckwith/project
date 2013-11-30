<%@ page import="edu.harvard.cscie56.Tithe" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tithe.label', default: 'Tithe')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-tithe" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-tithe" class="content scaffold-create" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${titheInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${titheInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<section class="lampstand-wrapper">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:form action="save" class="lampstand-form">
					<g:render template="form"/>
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</g:form>
			<hr id="line1">
				<div>
				<small><b>Note:&nbsp;</b>Enter the Number as it appears on the Church Member's Tithe card. the format of the Tithe ID should be as follows: 0023 should be entered as '23'.</small>
				</div>
			</section>
		</div>
	</body>
</html>
