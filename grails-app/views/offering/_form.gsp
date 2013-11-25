<%@ page import="edu.harvard.cscie56.Offering" %>

        <link rel="stylesheet" href="${resource(dir: 'css', file: 'classic.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'classic.date.css')}" type="text/css">
<div class="fieldcontain ${hasErrors(bean: offeringInstance, field: 'service', 'error')} ">
	<label for="service">
		<g:message code="offering.service.label" default="Service" />
		
	</label>
	<g:select name="service" noSelection="['':'Select Church Service']" from="${['Sunday Worship Service','Mid-Week Bible Studies','Friday Half-Night','Special Service'] }" value="${offeringInstance?.service }"/>
	
</div>
<div class="fieldcontain ${hasErrors(bean: offeringInstance, field: 'amountCash', 'error')} required">
	<label for="amountCash">
		<g:message code="offering.amountCash.label" default="Amount Cash" />
		<span class="required-indicator">*</span>
	</label>

	<g:field name="amountCash" value="${fieldValue(bean: offeringInstance, field: 'amountCash')}" size="10"/>
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
	<g:textField id="offeringDate"name="offeringDate" value="${offeringInstance?.offeringDate}"/>
</div>

       		<g:javascript src="picker.js"/>
		<g:javascript src="picker.date.js"/>
		<g:javascript src="legacy.js"/>
        <script type="text/javascript">
           $('#offeringDate').pickadate({
                format: 'mm/dd/yyyy'
           });

         </script>

