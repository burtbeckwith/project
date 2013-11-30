<%@ page import="edu.harvard.cscie56.Attendance" %>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'classic.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'classic.date.css')}" type="text/css">
<h1>New Attendance</h1>
<div class="lampstand-outer lampstand-required">
	<div class="lampstand-inner">
			<label for="gender">Service or Event Name:</label>
				<g:select name="service" 
				noSelection="['':'Select Church Service']" 
				from="${['Sunday Worship Service','Mid-Week Bible Studies','Friday Half-Night','Special Service'] }" 
				value="${attendanceInstance?.service }"/>
		</div>
</div>

<div class="lampstand-outer lampstand-required">
	<div class="lampstand-inner">
		<label for="agegroup">Service Date:</label>
			<g:textField id="serviceDate"name="serviceDate" value="${attendanceInstance?.serviceDate}"/>
	</div>
</div>
<div class="lampstand-outer">
	<div class="lampstand-inner">
		<label for="input-title">Adults Number:</label> 
		<g:textField name="adultsNumber" value="${attendanceInstance?.adultsNumber}" size="10"/>
	</div>
</div>
<div class="lampstand-outer lampstand-required">
	<div class="lampstand-inner">
		<label for="email">Children Number:</label>
	<g:textField name="childrenNumber" value="${attendanceInstance?.childrenNumber}" size="10"/>
	</div>
</div>
<div class="lampstand-outer">
	<div class="lampstand-inner">
	<label for="memberNumber">Number of Church Member's</label>
		<input type="text" id="memberNumber" name="memberNumber" value="${attendanceInstance?.memberNumber}">
	</div>
</div>
<div class="lampstand-outer">
	<div class="lampstand-inner">
		<label for="input-title">Guest Number:</label> 
		<g:textField name="guestNumber" value="${attendanceInstance?.guestNumber}" size="10"/>
	</div>
</div>


       		<g:javascript src="picker.js"/>
		<g:javascript src="picker.date.js"/>
		<g:javascript src="legacy.js"/>
        <script type="text/javascript">
           $('#serviceDate').pickadate({
                format: 'mm/dd/yyyy'
           });
         </script>
