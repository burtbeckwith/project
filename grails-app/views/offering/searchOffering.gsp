<html>
<div>
	<form>
		<label for="titheID">Tithe ID:</label><input type="text" name="titheID" size="10">
		<label for="titheYear">Tithe Year:</label><input type="text" name="titheYear" value="Grails Select goes here">
		<input type="submit" class="searchBtn" value="Search Tithe">
	</form>
	</div>
	<div id="results">
		<table>
		<thead>
		<tr>
			<th>Year</th>
			<th>Month</th>
			<th>Tithe Amount</th>	
			<th>Approved By</th>
		</tr>	
		</thead>	
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
		</table>
	</div>

</html>