<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'predictionPal_icon.png')}" type="image/x-icon">
		<link rel="pPicon" href="${assetPath(src: 'predictionPal_icon.png')}">
		<link rel="pPicon" sizes="114x114" href="${assetPath(src: 'predictionPal_icon.png')}">
  		<asset:stylesheet src="application.css"/>
  		<asset:stylesheet src="jquery-ui.css"/>
		<asset:javascript src="application.js"/>
		
		<g:layoutHead/>
	</head>
	<body>
	<div id="navigation-bar">
		<div id="list-holder">
			<ul id="navigation-list" class="nav-root">
				<li class="nav-buttons"><a href="/PredictionPal/" class="button-text">Home</a></li>
				<li class="nav-buttons"><a href="PredictionPal/login" class="button-text">Login</a>	</li>
			</ul>
		</div>
		<div id="logo-holder" class="logo-hold">
			<h1 id="logo">PredictionPal</h1>
		</div>
		<div id="portal-holder" class="portal-hold">
			<g:form controller="tournament" action="portal">
				<fieldset id="code_fieldset">	
					<label for="title"></label>
					<g:textField name="code" placeholder="input tournament code" value="${code}"/>
					<g:submitButton name="portal" value="Go" />
			</fieldset>
			</g:form>
		</div>
	</div>
	<br/>
	<br/>
		<div class="main-container">
			<g:layoutBody/>		
		</div>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	</body>
</html>