
<%@ page import="edu.harvard.cscie56.PledgeImpl" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pledgeImpl.label', default: 'PledgeImpl')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pledgeImpl" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pledgeImpl" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pledgeImpl">
			
				<g:if test="${pledgeImplInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="pledgeImpl.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${pledgeImplInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pledgeImplInstance?.member}">
				<li class="fieldcontain">
					<span id="member-label" class="property-label"><g:message code="pledgeImpl.member.label" default="Member" /></span>
					
						<span class="property-value" aria-labelledby="member-label"><g:link controller="members" action="show" id="${pledgeImplInstance?.member?.id}">${pledgeImplInstance?.member?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pledgeImplInstance?.pledge}">
				<li class="fieldcontain">
					<span id="pledge-label" class="property-label"><g:message code="pledgeImpl.pledge.label" default="Pledge" /></span>
					
						<span class="property-value" aria-labelledby="pledge-label"><g:link controller="pledge" action="show" id="${pledgeImplInstance?.pledge?.id}">${pledgeImplInstance?.pledge?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${pledgeImplInstance?.id}" />
					<g:link class="edit" action="edit" id="${pledgeImplInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
