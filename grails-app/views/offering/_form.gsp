<%@ page import="edu.harvard.cscie56.Offering" %>



<div class="fieldcontain ${hasErrors(bean: offeringInstance, field: 'amountCash', 'error')} required">
	<label for="amountCash">
		<g:message code="offering.amountCash.label" default="Amount Cash" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amountCash" value="${fieldValue(bean: offeringInstance, field: 'amountCash')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: offeringInstance, field: 'amountCheck', 'error')} required">
	<label for="amountCheck">
		<g:message code="offering.amountCheck.label" default="Amount Check" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amountCheck" value="${fieldValue(bean: offeringInstance, field: 'amountCheck')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: offeringInstance, field: 'approvedBy', 'error')} ">
	<label for="approvedBy">
		<g:message code="offering.approvedBy.label" default="Approved By" />
		
	</label>
	<g:textField name="approvedBy" value="${offeringInstance?.approvedBy}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: offeringInstance, field: 'offeringDate', 'error')} ">
	<label for="offeringDate">
		<g:message code="offering.offeringDate.label" default="Offering Date" />
		
	</label>
	<g:textField name="offeringDate" value="${offeringInstance?.offeringDate}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: offeringInstance, field: 'service', 'error')} ">
	<label for="service">
		<g:message code="offering.service.label" default="Service" />
		
	</label>
	<g:textField name="service" value="${offeringInstance?.service}"/>
</div>

