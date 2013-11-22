
<%@ page import="edu.harvard.cscie56.TithePayment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tithePayment.label', default: 'TithePayment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tithePayment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tithePayment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tithePayment">
			
				<g:if test="${tithePaymentInstance?.acceptedBy}">
				<li class="fieldcontain">
					<span id="acceptedBy-label" class="property-label"><g:message code="tithePayment.acceptedBy.label" default="Accepted By" /></span>
					
						<span class="property-value" aria-labelledby="acceptedBy-label"><g:fieldValue bean="${tithePaymentInstance}" field="acceptedBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tithePaymentInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="tithePayment.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${tithePaymentInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tithePaymentInstance?.datePaid}">
				<li class="fieldcontain">
					<span id="datePaid-label" class="property-label"><g:message code="tithePayment.datePaid.label" default="Date Paid" /></span>
					
						<span class="property-value" aria-labelledby="datePaid-label"><g:fieldValue bean="${tithePaymentInstance}" field="datePaid"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tithePaymentInstance?.tithe}">
				<li class="fieldcontain">
					<span id="tithe-label" class="property-label"><g:message code="tithePayment.tithe.label" default="Tithe" /></span>
					
						<span class="property-value" aria-labelledby="tithe-label"><g:link controller="tithe" action="show" id="${tithePaymentInstance?.tithe?.id}">${tithePaymentInstance?.tithe?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${tithePaymentInstance?.titheMonth}">
				<li class="fieldcontain">
					<span id="titheMonth-label" class="property-label"><g:message code="tithePayment.titheMonth.label" default="Tithe Month" /></span>
					
						<span class="property-value" aria-labelledby="titheMonth-label"><g:fieldValue bean="${tithePaymentInstance}" field="titheMonth"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tithePaymentInstance?.titheYear}">
				<li class="fieldcontain">
					<span id="titheYear-label" class="property-label"><g:message code="tithePayment.titheYear.label" default="Tithe Year" /></span>
					
						<span class="property-value" aria-labelledby="titheYear-label"><g:fieldValue bean="${tithePaymentInstance}" field="titheYear"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tithePaymentInstance?.id}" />
					<g:link class="edit" action="edit" id="${tithePaymentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
