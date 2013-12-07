
<%@ page import="edu.harvard.cscie56.Pledge" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pledge.label', default: 'Pledge')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pledge" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pledge" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="created" title="${message(code: 'pledge.created.label', default: 'Created')}" />
					
						<g:sortableColumn property="createdBy" title="${message(code: 'pledge.createdBy.label', default: 'Created By')}" />
					
						<g:sortableColumn property="dueDate" title="${message(code: 'pledge.dueDate.label', default: 'Due Date')}" />
					
						<g:sortableColumn property="pledgeName" title="${message(code: 'pledge.pledgeName.label', default: 'Pledge Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pledgeInstanceList}" status="i" var="pledgeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pledgeInstance.id}">${fieldValue(bean: pledgeInstance, field: "created")}</g:link></td>
					
						<td>${fieldValue(bean: pledgeInstance, field: "createdBy")}</td>
					
						<td><g:formatDate date="${pledgeInstance.dueDate}" /></td>
					
						<td>${fieldValue(bean: pledgeInstance, field: "pledgeName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pledgeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
