<%@ page import="edu.harvard.cscie56.Offering" %>

        <link rel="stylesheet" href="${resource(dir: 'css', file: 'classic.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'classic.date.css')}" type="text/css">
<div class="lampstand-outer lampstand-required" >
	<div class="lampstand-inner">
		<label for="input-title">Church Service:</label>
	<g:select name="service" noSelection="['':'Select Church Service']" from="${['Sunday Worship Service','Mid-Week Bible Studies','Friday Half-Night','Special Service'] }" value="${offeringInstance?.service }"/>
	</div>
</div>
<div class="lampstand-outer lampstand-required">
	<div class="lampstand-inner">
		<label for="email">Total Checks:</label>
	<input type="text" name="amountCheck" value="${fieldValue(bean: offeringInstance, field: 'amountCheck')}" required>
	</div>
</div>

<div class="lampstand-outer lampstand-required">
	<div class="lampstand-inner">
		<label for="input-phone">Total Cash Amount:</label>
		<input type="text" name="amountCash" value="${fieldValue(bean: offeringInstance, field: 'amountCash')}" size="10">
	</div>
</div>

<div class="lampstand-outer lampstand-required">
	<div class="lampstand-inner">
		<label for="approvedBy">Approved By:</label> 
		<g:textField name="approvedBy" value="${offeringInstance?.approvedBy}"/>
	</div>
</div>
<div class="lampstand-outer lampstand-required">
	<div class="lampstand-inner">
		<label for="input-bdate">Offering Date</label> <input type="text"
			name="offeringDate" value="${offeringInstance?.offeringDate}"id="offeringDate" placeholder="MM/DD/YYYY">
	</div>
</div>

       		<g:javascript src="picker.js"/>
		<g:javascript src="picker.date.js"/>
		<g:javascript src="legacy.js"/>
        <script type="text/javascript">
           $('#offeringDate').pickadate({
                format: 'mm/dd/yyyy'
           });

         </script>

