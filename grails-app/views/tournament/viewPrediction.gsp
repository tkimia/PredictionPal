<html>
<head>
	<title>${prediction.name}'s Predictions</title>
	<meta name="layout" content="main"/>
		
	<asset:stylesheet href="tournament_form.css" />
</head>
<body>
	<h1>${prediction.name}'s Prediction for ${prediction.tournament.title}</h1>

	<g:if test="${prediction.tournament.state != 3}" >
		<p> The tournament is ongoing. Please check back later for results or, if you've entered your email, look for an
			email telling you that the match has finished </p>
	</g:if>
	<g:else>
		<g:link controller="tournament" action="results" id="${prediction.tournament.sid}">Click here to view all results</g:link>
	</g:else>

	<g:set var="traversedMatches" value="${new ArrayList()}"/>
	<div id="matches-container">
	<div id="formMatches">
	<g:set var="finishedTournament" value="${prediction.tournament.state==3}" />
	<g:each var="match" in="${prediction.tournament.matches.sort{it.orderchar}}">
		<g:set var="hgh" value="${75 + match.teams.size() * 25}"/> 
		<g:if test="${finishedTournament}">
			<g:set var="actualWinner" value="${match.winner.name}" />
		</g:if>
		<g:set var="predictedWinner" value="${match.matchPredictions.find{it.prediction.id == prediction.id}.predictedWinner.name}"/>
		<fieldset id="Match${match.id}" class="ui-draggable" style="right: auto; bottom: auto; top: ${match.posY}px; left: ${match.posX}px; position: relative; height: ${hgh}px;">

		<!--If it's a first round match-->
		<g:if test="${match.prevMatches.isEmpty()}" >

			<!--Set font color to identify correctness-->
			<g:if test="${finishedTournament}">
			<g:if test="${predictedWinner == actualWinner}">
				<font color="green">
			</g:if>
			<g:else>
				<font color="red">
			</g:else>
			</g:if>
			<br />

			<!--Display teams in match-->
			<g:each var="team" in="${match.teams.sort{it.id}}">

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
			<g:if test="${finishedTournament}">
			<g:if test="${predictedWinner==actualWinner}">
				<font color="green">
			</g:if>
			<g:else>
				<font color="red">
			</g:else>
			</g:if>
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
		</fieldset>
	</g:each>
</div>
</div>
</body>
</html>
