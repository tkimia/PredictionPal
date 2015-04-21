<html>
<head>
	<title>Today's Promotion!</title>
	<meta name="layout" content="main" />
</head>
<body>
	<g:form controller="tournament" action="index_display">
	<h2>Promotions: </h2>
</br>
	<p>Click the link(s) to predict:</p>
				<g:each in="${tournaments}" var="tournament">
				<g:if test="${tournament.promotions == true}">
				<a href="/PredictionPal/tournament/predict/${tournament.sid}">
					${tournament.title}
				</a>
				</g:if>
					<br/>
				</g:each>
	</g:form>
</body>