<%@ page import="edu.harvard.cscie56.Offering" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="Offering" />
		<title>Offering</title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-attendance" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="adultsNumber" title="${message(code: 'attendance.adultsNumber.label', default: 'Adults Number')}" />
					
						<g:sortableColumn property="childrenNumber" title="${message(code: 'attendance.childrenNumber.label', default: 'Children Number')}" />
					
						<g:sortableColumn property="createdBy" title="${message(code: 'attendance.createdBy.label', default: 'Created By')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'attendance.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="guestNumber" title="${message(code: 'attendance.guestNumber.label', default: 'Guest Number')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${offeringInstanceList}" status="i" var="offeringInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: offeringInstance, field: "service")}</td>
					
						<td>${fieldValue(bean: offeringInstance, field: "offeringDate")}</td>
					
						<td>${fieldValue(bean: offeringInstance, field: "approvedBy")}</td>
					
						<td>${fieldValue(bean: offeringInstance, field: "amountCash")}</td>
					
						<td>${fieldValue(bean: offeringInstance, field: "amountCheck")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${offeringInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
