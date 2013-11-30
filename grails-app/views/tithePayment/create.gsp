<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Tithe Payments</title>
</head>
<body>
	<div class="nav" role="navigation">
		<ul>
			<li><g:link class="list" action="index">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="create-tithePayment">
		<h1>
			<g:message code="default.create.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${tithePaymentInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${tithePaymentInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<div>
			<g:form name="idSearch" action="searchTitheID">
				<label>Tithe ID:</label>
				<input type="text" name="titheID" autocomplete="off">
				<g:submitButton name="search" value="Search Tithe" />
			</g:form>
		</div>
		<g:form url="[resource:tithePaymentInstance, action:'save']">
			<fieldset class="form">
				<g:render template="form" />
			</fieldset>
			<fieldset class="buttons">
				<g:submitButton name="create" class="save"
					value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
