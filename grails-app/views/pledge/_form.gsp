<%@ page import="edu.harvard.cscie56.Pledge" %>



<div class="fieldcontain ${hasErrors(bean: pledgeInstance, field: 'created', 'error')} ">
	<label for="created">
		<g:message code="pledge.created.label" default="Created" />
		
	</label>
	<g:textField name="created" value="${pledgeInstance?.created}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pledgeInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="pledge.createdBy.label" default="Created By" />
		
	</label>
	<g:textField name="createdBy" value="${pledgeInstance?.createdBy}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pledgeInstance, field: 'dueDate', 'error')} required">
	<label for="dueDate">
		<g:message code="pledge.dueDate.label" default="Due Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dueDate" precision="day"  value="${pledgeInstance?.dueDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: pledgeInstance, field: 'pledgeName', 'error')} ">
	<label for="pledgeName">
		<g:message code="pledge.pledgeName.label" default="Pledge Name" />
		
	</label>
	<g:textField name="pledgeName" value="${pledgeInstance?.pledgeName}"/>
</div>

