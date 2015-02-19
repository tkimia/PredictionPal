<html>
<head>
	<title>
	Predict for ${ tournament.title } 
	</title>
	<meta name="layout" content="main"/>
</head>
<body>
	<h1>Predict for ${ tournament.title } </h1>

	<!--formset>
		<legend>Test</legend>
		<g:each var="match" in="${tournament.matches}">
			<g:each var="team" in="${match.teams}">
				<li>${team.name}</li>
			</g:each>
		</g:each>
	</formset-->

	<formset>
		<g:form method="post" action="addPrediction">
		<legend>Enter a Prediction</legend>
		<g:each var="match" in="${tournament.matches.sort {it.id}}">
			<g:if test="${match.prevMatches.isEmpty()}">
				<g:each var="team" in="${match.teams.sort {it.id}}">	
					<input type="radio" name="${match.id}" 
						value="${team.name}">${team.name}<br/>
				</g:each>
				<br/>
			</g:if>		
		</g:each>
		<g:submitButton name="addPredictions" value="Make Predictions"/>
		</g:form>
	</formset>


</body>
</html>