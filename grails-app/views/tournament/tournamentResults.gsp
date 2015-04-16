<html>
<head>
	<title>Results for Tournament ${tournament.title}</title>
	<meta name="layout" content="main"/>
</head>
<body>
	<g:if test="${tournament.state==3}">
	<h1>Results for the ${tournament.title} tournament</h1>
	<g:each var="match" in="${tournament.matches.sort {it.id}}">
		<g:set var="winnerName" value="${match.winner.name}" />

		<!--Calculating percentage -->
		<g:set var="correctCounter" value="${0}"/>
		<g:each var="prediction" in="${match.matchPredictions}">
		<g:if test="${prediction.predictedWinner.name == winnerName}">
			<g:set var="correctCounter" value="${correctCounter+1}" />
		</g:if>
		</g:each>
		<g:set var="percentage" value="${correctCounter/match.matchPredictions.size()*100}" />
		${percentage}% of participants predicted this match correctly. <br />

		<g:each var="team" in="${match.teams}">
		
			<g:if test="${team.name == winnerName}">
			<b>${team.name}</b>
			</g:if>
			<g:else>
	   			${team.name}
			</g:else>
			<br />
			</g:each>
		<br />
	</g:each>
	</g:if>
	<g:else>
		<h1>Tournament ${tournament.title} still in progress!</h1>
	</g:else>
</body>
</html>