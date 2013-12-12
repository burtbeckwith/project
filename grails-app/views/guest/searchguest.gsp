<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'guest.label', default: 'Guest')}" />
		<title>Search Guest</title>
		        <link rel="stylesheet" href="${resource(dir: 'css', file: 'classic.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'classic.date.css')}" type="text/css">
	</head>
	<body>
		<div>
			<div>

			</div>
			<form action="searchGuest" method="post">
			<label for="searchdate">Service Date:</label>&nbsp;<input type="text"id="guestDate" name="searchdate" value="" >&nbsp;&nbsp;&nbsp;
			<g:select name="service" 
				noSelection="['':'Select Church Service']" 
				from="${['Sunday Worship Service','Mid-Week Bible Studies','Friday Half-Night','Special Service'] }" 
				value=""/>
			<input type="submit" value="Search Guest">
			</form>
		</div>
		<div>
		<g:if test="${guestInstanceList }">
		<div>
			<h1>${serviceName }</h1>
			<h3>${serviceDate }</h3>
			<hr id="line1">
		</div>
		<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'guest.guestStatus.label', default: 'Guest Status')}" />
					
						<g:sortableColumn property="Phone Number" title="${message(code: 'guest.homePhone.label', default: 'Phone Number')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'guest.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'guest.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="guestStatus" title="${message(code: 'guest.address1.label', default: 'Guest Status')}" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${guestInstanceList}" status="i" var="guestInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${guestInstance.id}">${fieldValue(bean: guestInstance, field: "name")}</g:link></td>
					
						<td>C:${fieldValue(bean: guestInstance, field: "mobilePhone")}&nbsp;<br> H:${fieldValue(bean: guestInstance, field: "homePhone")}</td>
					
						<td>${fieldValue(bean: guestInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: guestInstance, field: "address")}&nbsp;<br>${fieldValue(bean: guestInstance, field: "address1")}&nbsp;${fieldValue(bean: guestInstance, field: "city")}&nbsp;${fieldValue(bean: guestInstance, field: "state")}&nbsp;,${fieldValue(bean: guestInstance, field: "zip")}</td>
					
						<td>${fieldValue(bean: guestInstance, field: "guestStatus")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			</g:if>
			<div class="error">
			<g:if test="${flash.message }">
			<li>${flash.message }</li>
			</g:if>
			</div>
		</div>
		

       		<g:javascript src="picker.js"/>
		<g:javascript src="picker.date.js"/>
		<g:javascript src="legacy.js"/>
        <script type="text/javascript">
           $('#guestDate').pickadate({
                format: 'mm/dd/yyyy'
           });
         </script>
	</body>
</html>