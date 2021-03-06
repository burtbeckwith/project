<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>CSCIE56 Final Project - Church Management System</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'default.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'component.css')}" type="text/css">
		<g:javascript library='jquery' plugin='jquery' />
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
		<div class="appHeader">
		<span>CSCIE56 Final Project 2013</span>
		<span id="appName">
		<sec:ifLoggedIn> 
		Logged in as: <sec:loggedInUserInfo field="username"/>
		&nbsp;&nbsp; | &nbsp;&nbsp;</sec:ifLoggedIn>
		Church Management System&nbsp;&nbsp;|&nbsp;&nbsp; <%=link(controller: 'logout'){'Logout'} %> &nbsp;&nbsp;</span>
		</div>
		<div class="header">
		<nav id="cbp-hrmenu" class="cbp-hrmenu">
					<ul>
						<li>
							<a href="#">Membership</a>
							<div class="cbp-hrsub">
								<div class="cbp-hrsub-inner"> 
									<div>
										<ul>
											<li><%= link(action:'create',controller:'members') { 'New Members' }%></li>
											<li><%= link(action:'index',controller:'members') { 'List Members' }%></li>
											<li><%= link(action:'find',controller:'members') { 'Search for Member' }%></li>
										</ul>
									</div>
								</div><!-- /cbp-hrsub-inner -->
							</div><!-- /cbp-hrsub -->
						</li>
						<li>
							<a href="#">Offering and Tithes</a>
							<div class="cbp-hrsub">
								<div class="cbp-hrsub-inner">
									<div>
										<h4>Offering</h4>
										<ul>
											<li><%= link(action:'create',controller:'offering') { 'Create Offering' }%></li>
											<li><%= link(action:'index',controller:'offering') { 'List Offering' }%></li>
											<li><%= link(action: 'search', controller: 'offering'){'Search Offering'} %></li>
										</ul>
									</div>
									<div>
										<h4>Tithes</h4>
										<ul>
											<li><%= link(action: 'create', controller: 'tithe'){'Member Tithe'} %></li>
											<li><%= link(action:'create',controller:'tithePayment') { 'Tithe Payments' }%></li>
											<li><%= link(action: 'searchPayments', controller: 'tithePayment') {'Search Payment'} %></li>
										</ul>
									</div>									
								</div><!-- /cbp-hrsub-inner -->
							</div><!-- /cbp-hrsub -->
						</li>
						<li>
							<a href="#">Pledges</a>
							<div class="cbp-hrsub">
								<div class="cbp-hrsub-inner"> 
								<div>
										<h4>Pledge</h4>
										<ul>
											<li><%= link(action: 'create', controller: 'pledge'){'Create New Pledge'} %></li>
											<li><%= link(action:'list',controller:'pledge') { 'List Pledge\'s' }%></li>
										</ul>
									</div>
								</div><!-- /cbp-hrsub-inner -->
							</div><!-- /cbp-hrsub -->
						<li>
							<a href="#">Tools</a>
							<div class="cbp-hrsub">
								<div class="cbp-hrsub-inner"> 
									<div>
										<h4>Attendance</h4>
										<ul>
											<li><%= link(action: 'create',controller: 'attendance') {'Add Attendance'}%></li>
											<li><%= link(action: 'index',controller: 'attendance') {'List Attendance'}%></li>
											<li><%= link(action: 'search',controller: 'attendance') {'Search Attendance'}%></li>
										</ul>
									</div>
									<div>
										<h4>Guest</h4>
										<ul>
											<li><%= link(action: 'create',controller: 'guest') {'Add New Guest'}%></li>
											<li><%= link(action: 'index',controller: 'guest') {'List Guest'}%></li>
											<li><%= link(action: 'search',controller: 'guest') {'Search Guest'}%></li>
										</ul>
									</div>									
								</div><!-- /cbp-hrsub-inner -->
							</div><!-- /cbp-hrsub -->
						</li>
						<sec:ifLoggedIn>
						<li>
							<a href="#">Administrator</a>
							<div class="cbp-hrsub">
								<div class="cbp-hrsub-inner"> 
									<div>
										<h4>Users</h4>
										<ul>
										
											<li><%= link(action:'create',controller:'user') { 'Add New Users' }%></li>
											<li><%= link(action: 'search',controller: 'user'){'Search Users'} %></li>
											
										</ul>
										
									</div>
									<div>
										<h4>User Roles</h4>
										<ul>
											<li><%= link(action:'create',controller:'role') { 'Create Roles' }%></li>
											<li><%= link(action: 'search',controller: 'role'){'Search Roles'} %></li>
										</ul>
										
									</div>
									<div>
										<ul>
										<sec:ifLoggedIn>
											<li><%=link(controller: 'logout'){'Logout'} %></li>
										</sec:ifLoggedIn>
										</ul>
									</div>
								</div><!-- /cbp-hrsub-inner -->
							</div><!-- /cbp-hrsub -->
						</li>
						</sec:ifLoggedIn>
					</ul>
				</nav>
				</div>
				
		<div class="container">
		<div class="gap_1"></div>
		<g:layoutBody/>
		</div>
		
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<g:javascript src="cbpHorizontalMenu.js"/>
				<script>
			$(function() {
				cbpHorizontalMenu.init();
			});
		</script>
		<r:layoutResources />
		<g:javascript src='jquery/jquery.jgrowl.js' plugin='spring-security-ui'/>
<g:javascript src='jquery/jquery.checkbox.js' plugin='spring-security-ui'/>
<g:javascript src='spring-security-ui.js' plugin='spring-security-ui'/>
	</body>
	<div class="footer">Copyright &copy; 2013. All Rights Reserved for Hubert Kyeremateng Boateng</div>
</html>
