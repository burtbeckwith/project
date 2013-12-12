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
					List Tithe Payments
				</g:link></li>
		</ul>
	</div>
	<div id="create-tithePayment">
		<h1>
			Add Tithe Payment
		</h1>

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
		<g:if test="${flash.message}">
			<div class="messages" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:if test="${titheInstance || titheInstanceID}">
		<g:form url="[resource:tithePaymentInstance, action:'save']" class="lampstand-form">
				<g:render template="form" />
				<g:submitButton name="create" class="save"
					value="${message(code: 'default.button.create.label', default: 'Create')}" />
		</g:form>
		</g:if>
	</div>
</body>
</html>
