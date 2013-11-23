<!DOCTYPE html>
<html>
  <head>
    <title>attendance.html</title>
	<meta name="layout" content="main">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
   <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<style>
		#cancelBtn{
			float: right;
			margin-right: 10em;
		}
	</style>
  </head>
  <body>
   <div class="container">
   	   		<div class="nav">
			<ul>
				<li><g:link class="search" action="search">Search Offering</g:link></li>
				<li><g:link class="create" action="create">New Offering</g:link></li>
			</ul>
		</div>
   <h3> Offering </h3>
   <div id="results">
   1   <g:formRemote name="offering" url="[action: 'save']" update="results">
   	<table>
  			<tr><td>Service Name:</td><td><select name="service">
  				<option value="">Select Service or Event</option>
  				<option value="1">Sunday Worship Service</option>
  				<option value="2">Wednesday Bible Studies</option>
  				<option value="3">Half-Night Service</option>
  			</select></td></tr>
  			<tr>
  				<td>Number of Members:</td>
  				<td><input type="text" name="numberMembers" size="10"></td>
  			</tr>
  			<tr>
  				<td>Date of Offering:</td>
  				<td><input type="text" name="offeringDate" size="10"></td>
  			</tr>
  			  	<tr>
  				<td>Total Cash:</td>
  				<td><input type="text" name="totalCash" id="totalCash" size="10"></td>
  			</tr>
  			  	<tr>
  				<td>Total Check:</td>
  				<td><input type="text" id="totalCheck" name="totalCheck" size="10"></td>
  			</tr>
  			  	<tr>
  				<td>Approved By:</td>
  				<td><input type="text" name="approvedBy" size="10"></td>
  			</tr>
  		</table>

  		<div>
  			<input type="submit" class="saveBtn"value="Save and Continue">
  			<a href="cancel.html" id="cancelBtn">Cancel</a>
  		</div>
   </g:formRemote>
   </div>
   </div>
  </body>
</html>
