<html>
<head>
<meta name="layout" content="main">
<title>Search Offering</title>
</head>
<div>
	<h1>Search for Offering</h1>
	<fieldset>
	<legend>Offering Date</legend>	
	<g:form action="searchOffering">
		<label for="offeringDate">Date of Offering:</label>
		<input type="text"
			name="offeringDate" value="" id="offeringDate" placeholder="MM/DD/YYYY">
		<input type="submit"  value="Search Tithe">
	</g:form>
	</fieldset>
	<hr id="line1">
	</div>
				<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
	<div id="results">
	<g:if test="${offeringInstanceList}">
	<div><h2>Search Results</h2></div>
		<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="amountCash" title="${message(code: 'offering.amountCash.label', default: 'Amount Cash')}" />
					
						<g:sortableColumn property="amountCheck" title="${message(code: 'offering.amountCheck.label', default: 'Amount Check')}" />
					
						<g:sortableColumn property="approvedBy" title="${message(code: 'offering.approvedBy.label', default: 'Approved By')}" />
					
						<g:sortableColumn property="offeringDate" title="${message(code: 'offering.offeringDate.label', default: 'Offering Date')}" />
					
						<g:sortableColumn property="service" title="${message(code: 'offering.service.label', default: 'Service')}" />
						<th>Edit</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${offeringInstanceList}" status="i" var="offeringInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: offeringInstance, field: "amountCash")}</td>
					
						<td>${fieldValue(bean: offeringInstance, field: "amountCheck")}</td>
					
						<td>${fieldValue(bean: offeringInstance, field: "approvedBy")}</td>
					
						<td>${fieldValue(bean: offeringInstance, field: "offeringDate")}</td>
					
						<td>${fieldValue(bean: offeringInstance, field: "service")}</td>
						<td><g:link action="edit" id="${offeringInstance.id}">Edit</g:link></td>
					</tr>
				</g:each>
				</tbody>
			</table>
	</g:if>
	</div>

</html>