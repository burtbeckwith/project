<%@ page import="edu.harvard.cscie56.Tithe" %>



<div class="fieldcontain ${hasErrors(bean: titheInstance, field: 'member', 'error')} required">
	<label for="member">
		<g:message code="tithe.member.label" default="Member" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="member" name="member.id" from="${edu.harvard.cscie56.Members.list()}" optionKey="id" required="" optionValue="fullname"value="${titheInstance?.member?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: titheInstance, field: 'titheID', 'error')} required">
	<label for="titheID">
		<g:message code="tithe.titheID.label" default="Tithe ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="titheID" type="number" value="${titheInstance.titheID}" required=""/>
</div>

