
<%@ page import="edu.harvard.cscie56.TithePayment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tithePayment.label', default: 'TithePayment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tithePayment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tithePayment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="acceptedBy" title="${message(code: 'tithePayment.acceptedBy.label', default: 'Accepted By')}" />
					
						<g:sortableColumn property="amount" title="${message(code: 'tithePayment.amount.label', default: 'Amount')}" />
					
						<g:sortableColumn property="datePaid" title="${message(code: 'tithePayment.datePaid.label', default: 'Date Paid')}" />
					
						<th><g:message code="tithePayment.tithe.label" default="Tithe" /></th>
					
						<g:sortableColumn property="titheMonth" title="${message(code: 'tithePayment.titheMonth.label', default: 'Tithe Month')}" />
					
						<g:sortableColumn property="titheYear" title="${message(code: 'tithePayment.titheYear.label', default: 'Tithe Year')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tithePaymentInstanceList}" status="i" var="tithePaymentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tithePaymentInstance.id}">${fieldValue(bean: tithePaymentInstance, field: "acceptedBy")}</g:link></td>
					
						<td>${fieldValue(bean: tithePaymentInstance, field: "amount")}</td>
					
						<td>${fieldValue(bean: tithePaymentInstance, field: "datePaid")}</td>
					
						<td>${fieldValue(bean: tithePaymentInstance, field: "titheID")}</td>
					
						<td>${fieldValue(bean: tithePaymentInstance, field: "titheMonth")}</td>
					
						<td>${fieldValue(bean: tithePaymentInstance, field: "titheYear")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tithePaymentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
