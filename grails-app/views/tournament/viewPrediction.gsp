<html>
<head>
	<title>${prediction.name}'s Predictions</title>
	<meta name="layout" content="main"/>
</head>
<body>
	<h1>${prediction.name}'s Predictions</h1>

	<g:set var="traversedMatches" value="${new ArrayList()}"/>
	<g:each var="match" in="${prediction.tournament.matches.sort{it.id}}">
		<g:set var="actualWinner" value="${match.winner.name}" />
		<g:set var="predictedWinner" value="${match.matchPredictions.find{it.prediction.id == prediction.id}.predictedWinner.name}"/>

		<!--If it's a first round match-->
		<g:if test="${match.prevMatches.isEmpty()}" >

			<!--Set font color to identify correctness-->
			<g:if test="${predictedWinner == actualWinner}">
				<font color="green">
			</g:if>
			<g:else>
				<font color="red">
			</g:else>
			<br />

			<!--Display teams in match-->
			<g:each var="team" in="${match.teams}">

				<g:if test="${team.name == predictedWinner}">
					<b>${team.name}</b>
				</g:if>
				<g:else>
					${team.name}
				</g:else>

				<br />
			</g:each>
			</font>
			<br />
		</g:if>
		<g:else>

			<g:if test="${predictedWinner==actualWinner}">
				<font color="green">
			</g:if>
			<g:else>
				<font color="red">
			</g:else>
			<g:each var="previousMatch" in="${match.prevMatches}">
				<g:if test="${traversedMatches.contains(previousMatch)}">

				</g:if>
				<g:else>

				<g:set var="fakeBool" value="${traversedMatches.add(previousMatch)}" />
				<g:set var="matchPrediction" value="${previousMatch.matchPredictions.find{it.prediction.id == prediction.id}.predictedWinner.name}" />

				<g:if test="${matchPrediction == predictedWinner}">
					<b>${matchPrediction}</b>
				</g:if>
				<g:else>
					${matchPrediction}
				</g:else>
				<br />
			</g:else>
			</g:each>
			<br />
			</font>

		</g:else>
	</g:each>
</body>
</html>
