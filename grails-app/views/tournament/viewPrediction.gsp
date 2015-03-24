<html>
<head>
	<title>${prediction.name}'s Predictions</title>
	<meta name="layout" content="main"/>
</head>
<body>
	<h1>${prediction.name}'s Predictions</h1>
	<g:each var="matchPrediction" in="${prediction.matchPredictions.sort {it.id}}">
		<g:set var="match" value="${matchPrediction.correspondingMatch}"/>
		<g:each var="team" in="${match.teams}">
			<g:if test="${team.name == matchPrediction.predictedWinner.name}">
			<b>${team.name}</b>
			</g:if>
			<g:else>
   				"${team.name}"	"${matchPrediction.predictedWinner.name}"	"${matchPrediction.id}"
			</g:else>

			<br />
		</g:each>
		<br />
	</g:each>


</body>
</html>