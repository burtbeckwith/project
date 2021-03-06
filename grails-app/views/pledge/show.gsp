
<%@ page import="edu.harvard.cscie56.Pledge" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pledge.label', default: 'Pledge')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pledge" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pledge" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pledge">
			
				<g:if test="${pledgeInstance?.created}">
				<li class="fieldcontain">
					<span id="created-label" class="property-label"><g:message code="pledge.created.label" default="Created" /></span>
					
						<span class="property-value" aria-labelledby="created-label"><g:fieldValue bean="${pledgeInstance}" field="created"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pledgeInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="pledge.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue bean="${pledgeInstance}" field="createdBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pledgeInstance?.dueDate}">
				<li class="fieldcontain">
					<span id="dueDate-label" class="property-label"><g:message code="pledge.dueDate.label" default="Due Date" /></span>
					
						<span class="property-value" aria-labelledby="dueDate-label"><g:formatDate date="${pledgeInstance?.dueDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pledgeInstance?.pledgeName}">
				<li class="fieldcontain">
					<span id="pledgeName-label" class="property-label"><g:message code="pledge.pledgeName.label" default="Pledge Name" /></span>
					
						<span class="property-value" aria-labelledby="pledgeName-label"><g:fieldValue bean="${pledgeInstance}" field="pledgeName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:pledgeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${pledgeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
