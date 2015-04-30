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
	<g:each in="${tournaments}" var="tournament" status="i">
	<g:hiddenField name="id[${i}]" value="${tournament.sid}" />
	<a href="/PredictionPal/tournament/predict/${tournament.sid}">
	${tournament.title}
</a>
	<g:checkBox name="promotions[${i}]" value ="${tournament.promotions}" checked= "${tournament.promotions}" /> 

	
</br>
	<g:hiddenField name="temp_value" value = "${i}" />
	</g:each>
	<g:hiddenField name="i_value" value = "${temp_value}" />
	<g:submitButton name="update" value="Update" />
</g:form>
</body>