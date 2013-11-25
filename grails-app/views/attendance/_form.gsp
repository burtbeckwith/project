<%@ page import="edu.harvard.cscie56.Attendance" %>



<div class="fieldcontain ${hasErrors(bean: attendanceInstance, field: 'adultsNumber', 'error')} ">
	<label for="adultsNumber">
		<g:message code="attendance.adultsNumber.label" default="Adults Number" />
		
	</label>
	<g:textField name="adultsNumber" value="${attendanceInstance?.adultsNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attendanceInstance, field: 'childrenNumber', 'error')} ">
	<label for="childrenNumber">
		<g:message code="attendance.childrenNumber.label" default="Children Number" />
		
	</label>
	<g:textField name="childrenNumber" value="${attendanceInstance?.childrenNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attendanceInstance, field: 'created', 'error')} ">
	<label for="created">
		<g:message code="attendance.created.label" default="Created" />
		
	</label>
	<g:textField name="created" value="${attendanceInstance?.created}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attendanceInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="attendance.createdBy.label" default="Created By" />
		
	</label>
	<g:textField name="createdBy" value="${attendanceInstance?.createdBy}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attendanceInstance, field: 'guestNumber', 'error')} ">
	<label for="guestNumber">
		<g:message code="attendance.guestNumber.label" default="Guest Number" />
		
	</label>
	<g:textField name="guestNumber" value="${attendanceInstance?.guestNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attendanceInstance, field: 'memberNumber', 'error')} ">
	<label for="memberNumber">
		<g:message code="attendance.memberNumber.label" default="Member Number" />
		
	</label>
	<g:textField name="memberNumber" value="${attendanceInstance?.memberNumber}"/>
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

