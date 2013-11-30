
<%@ page import="edu.harvard.cscie56.Offering" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'offering.label', default: 'Offering')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-offering" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-offering" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="amountCash" title="${message(code: 'offering.amountCash.label', default: 'Amount Cash')}" />
					
						<g:sortableColumn property="amountCheck" title="${message(code: 'offering.amountCheck.label', default: 'Amount Check')}" />
					
						<g:sortableColumn property="approvedBy" title="${message(code: 'offering.approvedBy.label', default: 'Approved By')}" />
					
						<g:sortableColumn property="offeringDate" title="${message(code: 'offering.offeringDate.label', default: 'Offering Date')}" />
					
						<g:sortableColumn property="service" title="${message(code: 'offering.service.label', default: 'Service')}" />
						<th>Edit</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${offeringInstanceList}" status="i" var="offeringInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: offeringInstance, field: "amountCash")}</td>
					
						<td>${fieldValue(bean: offeringInstance, field: "amountCheck")}</td>
					
						<td>${fieldValue(bean: offeringInstance, field: "approvedBy")}</td>
					
						<td>${fieldValue(bean: offeringInstance, field: "offeringDate")}</td>
					
						<td>${fieldValue(bean: offeringInstance, field: "service")}</td>
						<td><g:link action="edit" id="${offeringInstance.id}">Edit</g:link></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${offeringInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
