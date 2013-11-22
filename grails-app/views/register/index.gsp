<html>

<head>
	<meta name='layout' content='main'/>
	<title><g:message code='spring.security.ui.register.title'/></title>
</head>

<body>
<div class="container">
<g:form action='register' name='registerForm' style="width='650' height='300'">

	<g:if test='${emailSent}'>
	<br/>
	<g:message code='spring.security.ui.register.sent'/>
	</g:if>
	<g:else>
<p></p>
	<h3>Create New Users</h3>
	<hr id="line1">
	<table>
	<tbody>

		<s2ui:textFieldRow name='username' labelCode='user.username.label' bean="${command}"
                         size='40' labelCodeDefault='Username' value="${command.username}"/>

		<s2ui:textFieldRow name='email' bean="${command}" value="${command.email}"
		                   size='40' labelCode='user.email.label' labelCodeDefault='E-mail'/>

		<s2ui:passwordFieldRow name='password' labelCode='user.password.label' bean="${command}"
                             size='40' labelCodeDefault='Password' value="${command.password}"/>

		<s2ui:passwordFieldRow name='password2' labelCode='user.password2.label' bean="${command}"
                             size='40' labelCodeDefault='Password (again)' value="${command.password2}"/>

	</tbody>
	</table>

	<input type="submit"  form='registerForm' value='Create Account'/>

	</g:else>

</g:form>



<script>
$(document).ready(function() {
	$('#username').focus();
});
</script>
</div>
</body>
</html>
