
<%@ page import="edu.harvard.cscie56.PledgeImpl" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pledgeImpl.label', default: 'PledgeImpl')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pledgeImpl" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pledgeImpl" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="pledgeImpl.member.label" default="Member" /></th>
					
						<g:sortableColumn property="amount" title="${message(code: 'pledgeImpl.amount.label', default: 'Amount')}" />
					
						<g:sortableColumn property="created" title="${message(code: 'pledgeImpl.created.label', default: 'Created')}" />
					
						<g:sortableColumn property="createdBy" title="${message(code: 'pledgeImpl.createdBy.label', default: 'Created By')}" />
					
						<g:sortableColumn property="modifiedBy" title="${message(code: 'pledgeImpl.modifiedBy.label', default: 'Modified By')}" />
					
						<th><g:message code="pledgeImpl.pledge.label" default="Pledge" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pledgeImplInstanceList}" status="i" var="pledgeImplInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pledgeImplInstance.id}">${fieldValue(bean: pledgeImplInstance, field: "member")}</g:link></td>
					
						<td>${fieldValue(bean: pledgeImplInstance, field: "amount")}</td>
					
						<td>${fieldValue(bean: pledgeImplInstance, field: "created")}</td>
					
						<td>${fieldValue(bean: pledgeImplInstance, field: "createdBy")}</td>
					
						<td>${fieldValue(bean: pledgeImplInstance, field: "modifiedBy")}</td>
					
						<td>${fieldValue(bean: pledgeImplInstance, field: "pledge")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pledgeImplInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
