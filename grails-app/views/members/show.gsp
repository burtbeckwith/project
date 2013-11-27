
<%@ page import="edu.harvard.cscie56.Members" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'members.label', default: 'Members')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav">
		<h3>
				<g:if test="${membersInstance?.fullname}">
					<g:fieldValue bean="${membersInstance}" field="fullname"/>
				</g:if>
			</h3>
		</div>
		<div>Contact Information<hr>
		
		</div>
		<div id="show-members" class="content scaffold-show" role="main">
			<label><b>Email Address:</b>&nbsp;<g:fieldValue bean="${membersInstance}" field="email"/></label>&nbsp;&nbsp;<label><b>Gender&nbsp;</b>:&nbsp;<g:fieldValue bean="${membersInstance}" field="gender"/></label><br>
			<label><b>Phone Number:</b>&nbsp;<g:fieldValue bean="${membersInstance}" field="phone"/></label>
			<hr id="line1">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:form url="[resource:membersInstance, action:'delete']" method="DELETE">
				<div class="buttons">
					<g:link class="edit" action="edit" resource="${membersInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</div>
			</g:form>
		</div>
		<div class="sendContact">
			<g:formRemote name="sendemail" url="[controller:'member',action: 'sendContact']">
			<div><label for="name">Name:</label><span>${membersInstance?.fullname }</span>
			<input type="hidden" name="email" value="${membersInstance?.email}">
			</div>
			<div>To:<select name="to">
			<option value="">Select </option>
			<option value="prayer_request@centralgospelri.com">Prayer Request</option>
			<option value="info@centralgospelri.com">Information request</option>
			</select></div>
			<div><label for="subject">Message:</label><br><g:textArea name="message" rows="5" cols="30"></g:textArea></div>
			<input type="submit" value="Send Email">
			</g:formRemote>
		</div>
	</body>
</html>
