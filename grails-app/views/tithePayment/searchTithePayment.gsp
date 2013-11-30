<html>
<head>
<meta name="layout" content="main">
<title>Search Offering</title>
</head>
<div>
	<g:form action="searchTithe">
		<label for="titheID">Tithe ID:</label><input type="text" name="titheID" size="10">
		<label for="titheYear">Tithe Year:</label><select name="titheYear" id="titheYear">
		<option value="" selected="selected">-Choose-</option>
		<option value="2011">2011</option>
		<option value="2012">2012</option>
		<option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
		<option value="2016">2016</option>
		<option value="2017">2017</option>
		<option value="2018">2018</option>
		<option value="2019">2019</option>
		<option value="2020">2020</option>
		</select>

		<input type="submit" class="searchBtn" value="Search Tithe">
	</g:form>
	</div>
				<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
	<div id="results">
	<g:if test="${tithePaymentInstanceList}">
	<hr id="line1">
	Search Results:
	<g:each var="tithe" in="${tithePaymentInstanceList }">
		
		<div><h3>${fieldValue(bean: tithe, field: "tithe.member")}</h3></div>
		
		</g:each>

	
		<table>
		<thead>
		<tr>
			<th>Year</th>
			<th>Month</th>	
			<th>Amount Paid</th>
			<th>Payment Date</th>
		</tr>	
		</thead>	
		<g:each in="${tithePaymentInstanceList}" status="i" var="tithePaymentInstance">
		<tbody class="${(i % 2) == 0 ? 'even' : 'odd'}">
		<tr>
						<td>${fieldValue(bean: tithePaymentInstance, field: "titheYear")}</td>
					
						<td>${fieldValue(bean: tithePaymentInstance, field: "titheMonth")}</td>
					
						<td>$&nbsp;<g:formatNumber number="${fieldValue(bean: tithePaymentInstance, field: "amount")}" /></td>
					
						<td>${fieldValue(bean: tithePaymentInstance, field: "datePaid")}</td>
		</tr>
		</tbody>
		</g:each>
		</table>
	</g:if>
	</div>

</html>