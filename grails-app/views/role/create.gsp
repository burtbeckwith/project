<%@ page import="org.codehaus.groovy.grails.plugins.PluginManagerHolder" %>
<%@ page import="grails.plugin.springsecurity.SpringSecurityUtils" %>
<html>

<head>
	<meta name='layout' content='main'/>
	<g:set var="entityName" value="${message(code: 'role.label', default: 'Role')}"/>
	<title><g:message code="default.create.label" args="[entityName]"/> - Church Management Software</title>
	<r:require modules="spring-security-ui"/>
</head>

<body class="container">
<h3>New Role</h3>
<hr>
<div>
<g:if test="${flash.message }">
<div class="messages">
${flash.message }
</div>
</g:if>
	<g:form action="save" name='roleCreateForm'>
		<div class="dialog">

			<br/>

			<table>
				<tbody>

					<s2ui:textFieldRow name='authority' labelCode='role.authority.label' bean="${role}"
					                   size='50' labelCodeDefault='Authority' value="${role?.authority}"/>

					<tr><td>&nbsp;</td></tr>

					<tr class="prop">
						<td valign="top">
						<input type="submit" value="Create Role">
							
						</td>
					</tr>

				</tbody>
			</table>
		</div>

	</g:form>

</div>

<script>
$(document).ready(function() {
	$('#authority').focus();
});
</script>

</body>
</html>
