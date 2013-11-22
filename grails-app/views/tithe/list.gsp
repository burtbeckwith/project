
<%@ page import="edu.harvard.cscie56.Tithe" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tithe.label', default: 'Tithe')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tithe" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tithe" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="tithe.member.label" default="Member" /></th>
					
						<g:sortableColumn property="titheID" title="${message(code: 'tithe.titheID.label', default: 'Tithe ID')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${titheInstanceList}" status="i" var="titheInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${titheInstance.id}">${fieldValue(bean: titheInstance, field: "member.fullname")}</g:link></td>
					
						<td>${fieldValue(bean: titheInstance, field: "titheID")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${titheInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
