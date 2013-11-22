<%@ page import="edu.harvard.cscie56.Members" %>



<div class="fieldcontain ${hasErrors(bean: membersInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="members.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${membersInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: membersInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="members.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${membersInstance?.phone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: membersInstance, field: 'fullname', 'error')} ">
	<label for="fullname">
		<g:message code="members.fullname.label" default="Fullname" />
		
	</label>
	<g:textField name="fullname" value="${membersInstance?.fullname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: membersInstance, field: 'gender', 'error')} ">
	<label for="gender">
		<g:message code="members.gender.label" default="Gender" />
		
	</label>
	<g:textField name="gender" value="${membersInstance?.gender}"/>
</div>

