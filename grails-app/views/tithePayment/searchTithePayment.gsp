<html>
<head>
<meta name="layout" content="main">
<title>Search Offering</title>
</head>
<div>
	<g:form action="searchTithe">
		<label for="titheID">Tithe ID:</label><input type="text" name="titheID" size="10">
		<label for="titheYear">Tithe Year:</label><input type="text" name="titheYear" value="Grails Select goes here">
		<input type="submit" class="searchBtn" value="Search Tithe">
	</g:form>
	</div>
	<div id="results">
	<g:if test="${tithePayments }">
		<table>
		<thead>
		<tr>
			<th>Year</th>
			<th>Month</th>
			<th>Tithe Amount</th>	
			<th>Approved By</th>
		</tr>	
		</thead>	
		<g:each in="${offeringInstanceList}" status="i" var="offeringInstance">
		<tbody class="${(i % 2) == 0 ? 'even' : 'odd'}">
		<tr>
			<td>2013</td>
			<td>June</td>
			<td>$200</td>
			<td>Hubert Boateng</td>
		</tr>
				<tr class="odd">
			<td>2013</td>
			<td>June</td>
			<td>$200</td>
		</tr>
		</tbody>
		</g:each>
		</table>
	</g:if>
	</div>

</html>