<%@ page import="edu.harvard.cscie56.Attendance" %>



<div class="fieldcontain ${hasErrors(bean: attendanceInstance, field: 'adultsNumber', 'error')} required">
	<label for="adultsNumber">
		<g:message code="attendance.adultsNumber.label" default="Adults Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="adultsNumber" type="number" value="${attendanceInstance.adultsNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: attendanceInstance, field: 'childrenNumber', 'error')} required">
	<label for="childrenNumber">
		<g:message code="attendance.childrenNumber.label" default="Children Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="childrenNumber" type="number" value="${attendanceInstance.childrenNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: attendanceInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="attendance.createdBy.label" default="Created By" />
		
	</label>
	<g:textField name="createdBy" value="${attendanceInstance?.createdBy}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attendanceInstance, field: 'guestNumber', 'error')} required">
	<label for="guestNumber">
		<g:message code="attendance.guestNumber.label" default="Guest Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="guestNumber" type="number" value="${attendanceInstance.guestNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: attendanceInstance, field: 'memberNumber', 'error')} required">
	<label for="memberNumber">
		<g:message code="attendance.memberNumber.label" default="Member Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="memberNumber" type="number" value="${attendanceInstance.memberNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: attendanceInstance, field: 'service', 'error')} ">
	<label for="service">
		<g:message code="attendance.service.label" default="Service" />
		
	</label>
	<g:textField name="service" value="${attendanceInstance?.service}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attendanceInstance, field: 'serviceDate', 'error')} ">
	<label for="serviceDate">
		<g:message code="attendance.serviceDate.label" default="Service Date" />
		
	</label>
	<g:textField name="serviceDate" value="${attendanceInstance?.serviceDate}"/>
</div>

