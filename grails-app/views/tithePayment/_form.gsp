<%@ page import="edu.harvard.cscie56.TithePayment" %>


<g:if test="${titheInstance || titheInstanceID}">
<g:each var="tithe" in="${titheInstance }">
<li>${tithe.member }</li>
</g:each>

<div class="fieldcontain ${hasErrors(bean: tithePaymentInstance, field: 'acceptedBy', 'error')} ">
	<label for="acceptedBy">
		<g:message code="tithePayment.acceptedBy.label" default="Accepted By" />
		
	</label>
	<g:textField name="acceptedBy" value="${tithePaymentInstance?.acceptedBy}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tithePaymentInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="tithePayment.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" value="${fieldValue(bean: tithePaymentInstance, field: 'amount')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: tithePaymentInstance, field: 'datePaid', 'error')} ">
	<label for="datePaid">
		<g:message code="tithePayment.datePaid.label" default="Date Paid" />
		
	</label>
	<g:textField name="datePaid" value="${tithePaymentInstance?.datePaid}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tithePaymentInstance, field: 'tithe', 'error')} required">
	<label for="tithe">
		<g:message code="tithePayment.tithe.label" default="Tithe" />
		<span class="required-indicator">*</span>
	</label>
	<g:hiddenField name="tithe.id" value="${titheInstanceID }"/>
	<!---<g:select id="tithe" name="tithe.id" from="${edu.harvard.cscie56.Tithe.list()}" optionKey="id" required="" value="${tithePaymentInstance?.tithe?.id}" class="many-to-one"/> --->
</div>

<div class="fieldcontain ${hasErrors(bean: tithePaymentInstance, field: 'titheMonth', 'error')} ">
	<label for="titheMonth">
		<g:message code="tithePayment.titheMonth.label" default="Tithe Month" />
		
	</label>
	<g:textField name="titheMonth" value="${tithePaymentInstance?.titheMonth}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tithePaymentInstance, field: 'titheYear', 'error')} ">
	<label for="titheYear">
		<g:message code="tithePayment.titheYear.label" default="Tithe Year" />
		
	</label>
	<g:textField name="titheYear" value="${tithePaymentInstance?.titheYear}"/>
</div>
</g:if>
