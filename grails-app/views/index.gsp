<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>
		
	</head>
	<body>
		<div class="container">
		<input type="hidden" name="createdBy" value="<sec:loggedInUserInfo field="id"/>">
<input type="hidden" name="dateCreated" value="<g:formatDate format="MM/dd/yyyy" date="${new Date()}"/>">
		</div>
	</body>
</html>
