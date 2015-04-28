<html>
<head>
	<title>Update Promotion</title>
	<meta name="layout" content="main" />
</head>
<body>
	<g:form controller="tournament" action="updatePromotion">
	<h2>Please update the promotion here:</h2>
	(Click to promote a Tournament)<p>
	(Uncheck to undo a promotion)
</br>
</br>
	<g:each in="${tournaments}" var="tournament">
	<a href="/PredictionPal/tournament/predict/${tournament.sid}">
	${tournament.title}
</a>
	<g:checkBox name="${tournament.sid}Checkbox" value ="${tournament.sid}Value" checked= "${tournament.promotions}" /> 
	<g:if test = "${tournament.promotions == true}">
	<g:link controller="tournament" action="changePromotion">Promoted</g:link>
</g:if>
<g:else>
	<g:link controller="tournament" action="changePromotion">Not Promoted</g:link>
</g:else>
	
</br>
	</g:each>

	<g:submitButton name="update" value="Update" />
</g:form>
</body>