<%@ page import="edu.harvard.cscie56.PledgeImpl" %>



<div class="fieldcontain ${hasErrors(bean: pledgeImplInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="pledgeImpl.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" value="${fieldValue(bean: pledgeImplInstance, field: 'amount')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: pledgeImplInstance, field: 'member', 'error')} required">
	<label for="member">
		<g:message code="pledgeImpl.member.label" default="Member" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="member" name="member.id" from="${edu.harvard.cscie56.Members.list()}" optionKey="id" required="" value="${pledgeImplInstance?.member?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pledgeImplInstance, field: 'pledge', 'error')} required">
	<label for="pledge">
		<g:message code="pledgeImpl.pledge.label" default="Pledge" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pledge" name="pledge.id" from="${edu.harvard.cscie56.Pledge.list()}" optionKey="id" required="" value="${pledgeImplInstance?.pledge?.id}" class="many-to-one"/>
</div>

