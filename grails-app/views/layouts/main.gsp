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
		<div>
		<nav id="cbp-hrmenu" class="cbp-hrmenu">
					<ul>
						<li>
							<a href="#">Membership</a>
							<div class="cbp-hrsub">
								<div class="cbp-hrsub-inner"> 
									<div>
										<h4>Members</h4>
										<ul>
											<li><%= link(action:'create',controller:'members') { 'New Members' }%></li>
											<li><%= link(action:'list',controller:'members') { 'List Members' }%></li>
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
											<li><%= link(action:'list',controller:'offering') { 'Add member\'s Pledge' }%></li>
											<li><%= link(action:'list',controller:'offering') { 'List Offering' }%></li>
										</ul>
									</div>
									<div>
										<h4>Tithes</h4>
										<ul>
											<li><%= link(action:'list',controller:'pledge') { 'List Offering' }%>Create Tithe</a></li>
											<li><a href="#">Member's Tithe Payment</a></li>
											<li><a href="#">Search Tithe Payment</a></li>
										</ul>
									</div>
								</div><!-- /cbp-hrsub-inner -->
							</div><!-- /cbp-hrsub -->
						</li>
						
						<li>
							<a href="#">Projects</a>
							<div class="cbp-hrsub">
								<div class="cbp-hrsub-inner"> 
									<div>
										<h4>Learning &amp; Games</h4>
										<ul>
											<li><a href="#">Catch the Bullet</a></li>
											<li><a href="#">Snoopydoo</a></li>
											<li><a href="#">Fallen Angel</a></li>
											<li><a href="#">Sui Maker</a></li>
											<li><a href="#">Wave Master</a></li>
											<li><a href="#">Golf Pro</a></li>
										</ul>
										<h4>Utilities</h4>
										<ul>
											<li><a href="#">Gadget Finder</a></li>
											<li><a href="#">Green Tree Express</a></li>
										</ul>
									</div>
									<div>
										<h4>Entertainment</h4>
										<ul>
											<li><a href="#">Gadget Finder</a></li>
											<li><a href="#">Green Tree Express</a></li>
											<li><a href="#">Green Tree Pro</a></li>
											<li><a href="#">Holy Cannoli</a></li>
											<li><a href="#">Wobbler 3.0</a></li>
											<li><a href="#">Coolkid</a></li>
										</ul>
									</div>
								</div><!-- /cbp-hrsub-inner -->
							</div><!-- /cbp-hrsub -->
						</li>
						<li>
							<a href="#">Administrator</a>
							<div class="cbp-hrsub">
								<div class="cbp-hrsub-inner"> 
									<div>
										<h4>Utilities</h4>
										<ul>
											<li><%= link(action:'index',controller:'register') { 'Add New Users' }%></li>
											<li><a href="#">Wobbler 3.0</a></li>
											<li><a href="#">Coolkid</a></li>
										</ul>
										<h4>Education</h4>
										<ul>
											<li><a href="#">Learn Thai</a></li>
											<li><a href="#">Math Genius</a></li>
											<li><a href="#">Chemokid</a></li>
										</ul>
									</div>
									<div>
										<h4>Professionals</h4>
										<ul>
											<li><a href="#">Success 1.0</a></li>
											<li><a href="#">Moneymaker</a></li>
										</ul>
									</div>
									<div>
										<h4>Learning &amp; Games</h4>
										<ul>
											<li><%=link(controller: 'logout'){'Logout'} %></li>
										</ul>
									</div>
								</div><!-- /cbp-hrsub-inner -->
							</div><!-- /cbp-hrsub -->
						</li>
					</ul>
				</nav>
				</div>
				
		<div class="container">
		<g:layoutBody/>
		</div>
		<div class="footer" role="contentinfo"></div>
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
</html>
