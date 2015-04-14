<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Prediction Pal</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="status" role="complementary">
			<h1>Where to?</h1>
			<ul>
				<li class="controller"><g:link controller="tournament" action="start">Make a new Tournament</g:link></li>
				<li class="controller"><g:link controller="tournament">View existing Tournaments</g:link></li>
				<li class="controller"><g:link controller="tournament" action="portal">Enter a tournament code</g:link>
				<li class="controller"><g:link controller="tournament" action="index_display">View Promotions</g:link>
				<!--<li class="controller"><g:link controller="tournament" action="index_display">View Promotions</g:link>-->
				<!-- <li class="controller"><g:link controller="prediction">View existing Predictions</g:link></li> -->
			</ul>			
		</div>
		<div id="page-body" role="main">
			<h1>Welcome to Prediction Pal!</h1>
			<p>Prediction Pal is a website dedicated to making tournament based predictions. 
			Currently a variety of tournaments can be made, from basketball tournaments to the
			Grammy awards. Once created a tournament can be shared with friends for some friendly
			competition. As the tournament progresses, the owner is able to easily update the
			winners, and anybody who participated automatically has their prediction updated as
			well. </p>
			<br></br>
			<h1>Why did we make Prediction Pal?</h1>
			<p>We decided to make prediction Pal because currently there is no easy to use
			alternative. Every year many sports fans sign up for March Madness as the NCAA
			tournament progresses, however the bracket used for that tournament is fixed
			and anybody wanting to host a similar style of prediction game for any other
			event would have to do it by hand. By creating Prediction Pal we have given
			the players the ability to make their own, with more freedom than a pre-existing
			grid could offer.</p>
		</div>
	</body>
</html>

