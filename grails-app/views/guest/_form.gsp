<%@ page import="edu.harvard.cscie56.Guest" %>

<div class="lampstand-outer lampstand-required">
	<div class="lampstand-inner">
	<label for="name">
		<g:message code="guest.name.label" default="Name" />
	</label>
	<input type="text" name="name" value="${guestInstance?.name}" size="30" required/>
</div>
</div>
<div class="lampstand-outer lampstand-required">
	<div class="lampstand-inner">
		<div class="fieldcontain ${hasErrors(bean: guestInstance, field: 'gender', 'error')} ">
			<label for="gender">
			
			</label>
			<g:select name="gender"
				from="${['Male','Female']}"
				value="${guestInstance?.gender}"
				noSelection="['': 'Select Gender']" />&nbsp;
		<g:select name="ageGroup"
				from="${['0-18','18-29']}"
				value="${guestInstance?.ageGroup}"
				noSelection="['': 'Select Age Group']" />
		</div>
	</div>
</div>


<div class="lampstand-outer lampstand-required">
	<div class="lampstand-inner">
	<label for="address">
		<g:message code="guest.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${guestInstance?.address}" size="30"/>
</div>
</div>

<div class="lampstand-outer lampstand-required">
	<div class="lampstand-inner">
	<label for="address1">
		<g:message code="guest.address1.label" default="Address1" />
		
	</label>
	<g:textField name="address1" value="${guestInstance?.address1}" placeholder="Optional" size="30"/>
</div>
</div>



<div class="lampstand-outer lampstand-required">
	<div class="lampstand-inner">
	<label for="city">
		<g:message code="guest.city.label" default="City" />
		<g:message code="guest.state.label" default="State" /> &
		<g:message code="guest.zip.label" default="Zip" />
	</label>
	<g:textField name="city" value="${guestInstance?.city}" size="20"/> &nbsp;&nbsp;
		<g:textField name="state" value="${guestInstance?.state?: 'MA'}" placeholder="State" size="20"/>&nbsp;&nbsp;
			<g:textField name="zip" value="${guestInstance?.zip}" maxLength="5" placeholder="Zip Code" size="5"/>
</div>
</div>

<div class="lampstand-outer lampstand-required">
	<div class="lampstand-inner">
	<label for="email">
		<g:message code="guest.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${guestInstance?.email}" size="30"/>
</div>
</div>

<div class="lampstand-outer lampstand-required">
	<div class="lampstand-inner">
	<label for="homePhone">
		<g:message code="guest.homePhone.label" default="Home Phone" />
		
	</label>
	<g:textField name="homePhone" value="${guestInstance?.homePhone}" placeholder="XXX-XXX-XXXX" />
</div>
</div>

<div class="lampstand-outer lampstand-required">
	<div class="lampstand-inner">
	<label for="mobilePhone">
		<g:message code="guest.mobilePhone.label" default="Mobile Phone" />
		
	</label>
	<g:textField name="mobilePhone" value="${guestInstance?.mobilePhone}" required placeholder="XXX-XXX-XXXX"/>
</div>
</div>
<div class="lampstand-outer lampstand-required">
	<div class="lampstand-inner">
	<label for="attendance">
		<g:message code="guest.attendance.label" default="Church Service Attended" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="attendance" name="attenance" from="${edu.harvard.cscie56.Attendance.list()}" optionKey="id" optionValue="service" required="" value="${guestInstance?.attendance?.id ?: attendanceName?.service}" class="many-to-one"/>
</div>
</div>
<input type="text" name="attendaance.id" value="${guestInstance?.attendance?.id ?: attendanceName?.service}" size="30" disabled="disabled">
<input type="hidden" name="attendance" value="${guestInstance?.attendance?.id ?: attendanceName?.id}" size="30" >

<div class="lampstand-outer lampstand-required">
	<div class="lampstand-inner">
	<label for="comments">
		<g:message code="guest.comments.label" default="Comments" />
		
	</label>
	<g:textArea name="comments" value="${guestInstance?.comments}" rows="5" cols="40"size="30"/>
</div>
</div>
<div class="lampstand-outer lampstand-required">
	<div class="lampstand-inner">
	<label> Guest Status:</label>
<g:radio name="guestStatus" value="${guestInstance?.guestStatus?:'First Time Guest'}"/>First Time Guest &nbsp;&nbsp;
<g:radio name="guestStatus" value="${guestInstance?.guestStatus?:'New To Area'}"/>New To Area<br>
<g:radio name="guestStatus" value="${guestInstance?.guestStatus?:'Would Like to become a Member'}"/>Would Like to become a Member&nbsp;&nbsp;
<g:radio name="guestStatus" value="${guestInstance?.guestStatus?:'Other'}"/>Other
</div>
</div>
<div class="lampstand-outer lampstand-required">
<div class="lampstand-inner">
<label> Marital Status:</label>
<g:radio name="maritalStatus" value="${guestInstance?.maritalStatus?:'Single'}"/>Single&nbsp;&nbsp;
<g:radio name="maritalStatus" value="${guestInstance?.maritalStatus?:'Married'}"/>Married<br>
<g:radio name="maritalStatus" value="${guestInstance?.maritalStatus?:'Single Parent'}"/>Single Parent&nbsp;&nbsp;
<g:radio name="maritalStatus" value="${guestInstance?.maritalStatus?:'Widowed'}"/>Widowed
</div>
</div>
