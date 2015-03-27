<html>
<head>
	<title>Your Result</title>
	<meta name="layout" content="main"/>
</head>
<body>
	<h1>${prediction.name}'s Predictions</h1>
	<g:each var="matchPrediction" in="${prediction.matchPredictions.sort {it.id}}">
		<g:set var="match" value="${matchPrediction.correspondingMatch}"/>
		<g:each var="team" in="${match.teams}">
			<g:if test="${team.name == matchPrediction.predictedWinner.name}">
			<b>The Winner you predicted for this match: ${team.name}</b>
			</g:if>
			<g:else>
   				"${team.name}" VS.	"${matchPrediction.predictedWinner.name}"
			</g:else>

			<br />
		</g:each>
		<br />
	</g:each>


</body>
</html>