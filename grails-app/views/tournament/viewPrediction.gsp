<html>
<head>
	<title>${prediction.name}'s Predictions</title>
	<meta name="layout" content="main"/>
</head>
<body>
	<h1>${prediction.name}'s Predictions</h1>

	<g:each var="matchPrediction" in="${prediction.matchPredictions.sort {it.id}}">

		<g:set var="match" value="${matchPrediction.correspondingMatch}"/>
		<g:if test="${match.prevMatches.isEmpty()}" >
			<g:each var="team" in="${match.teams}">
				<g:if test="${team.name == matchPrediction.predictedWinner.name}">
				<b>${team.name}</b>
				</g:if>
				<g:else>
	   				${team.name}
				</g:else>
				<br />
			</g:each>
			<br />
		</g:if>
		<g:else>
			<g:set var="nextMatch1" value="${match.nextMatch}" />
			<g:each var="matchPrediction2" in="${prediction.matchPredictions.sort {it.id}}">
				<g:set var="match2" value="${matchPrediction2.correspondingMatch}"/>
				<g:set var="nextMatch2" value="${match2.nextMatch}" />
				<g:if test="${nextMatch1 != null && nextMatch2 != null && nextMatch1.id == nextMatch2.id && match.id != match2.id}">
					
					${matchPrediction.predictedWinner} <br />
					${matchPrediction2.predictedWinner} <br />
					<br />
				</g:if>

			</g:each>
		</g:else>
	</g:each>
</body>
</html>
