<html>
<head>
	<title>Your Result</title>
	<meta name="layout" content="main"/>
</head>
<body>
	<h1>Your Predictions</h1>
	<g:each var="matchPrediction" in="${prediction.matchPredictions.sort {it.id}}">
		<g:set var="match" value="${matchPrediction.correspondingMatch}"/>
		<g:each var="team" in="${match.teams}">
			<g:if test="${team.name == matchPrediction.predictedWinner.name}">
			<b>The Winner you predicted for this match: ${team.name}</b>
			</g:if>
			<g:else>
   				"${team.name}" VS. "${matchPrediction.predictedWinner.name}"
			</g:else>

			<br />
		</g:each>
		<br />
	</g:each>
	<h1>Tournament Result: </h1>
	<g:if test="${prediction.tournament.state==3}">
	<g:set var="counter" value = "${0}"/>
	<g:each var="match" in="${prediction.tournament.matches.sort {it.id}}">
		<g:each var="team" in="${match.teams}">
			<g:if test="${team.name == match.winner.name}">
			<b>The Winner of this match is: ${team.name}</b>
			</g:if>
			<g:else>
	   			"${team.name}" VS. "${match.winner.name}"
			</g:else>
			<br />
			</g:each>
		<br />
	<g:set var="counter" value="${counter +1 }"/>
	</g:each>
	<h1>Final Result: </h1>
	<g:set var="counter"> ${prediction.predPoints  /  counter * 100}</g:set>
	You got ${prediction.predPoints } predictions correct! You got ${counter} % correct!

	</g:if>
	<g:else>
		<h1>Tournament ${prediction.tournament.title} still in progress!</h1>
	</g:else>
	
</body>
</html>