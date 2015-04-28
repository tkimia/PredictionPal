<html>
<head>
	<title>${prediction.name}'s Predictions</title>
	<meta name="layout" content="main"/>
		<style>
		fieldset {
	    font-family: sans-serif;
	    border: 5px solid #A34949;
	    background: none repeat scroll 0% 0% #DDD;
	    border-radius: 5px;
	    padding: 15px;
		}
		#formMatches fieldset{
			width: 250px;
			border: 3px solid #a34949;
		    padding: 10px;
		    height: 75px;
		    margin: 5px;
		}

		#formMatches fieldset legend{
			background: #000;
		    color: #fff;
		    box-shadow: 0 0 0 3px #a34949;
		}

		#matches-container {
			overflow-x: scroll;
			padding: 5px;

		}

		#formMatches {
			height: 550px;
			width: 1250px;
			background: #fff;
			border: 5px black;
		}
	</style>
</head>
<body>
	<h1>${prediction.name}'s Predictions</h1>

	<g:set var="traversedMatches" value="${new ArrayList()}"/>
	<div id="matches-container">
	<div id="formMatches">
	<g:each var="match" in="${prediction.tournament.matches.sort{it.orderchar}}">
		<g:set var="hgh" value="${75 + match.teams.size() * 25}"/> 
		<g:set var="actualWinner" value="${match.winner.name}" />
		<g:set var="predictedWinner" value="${match.matchPredictions.find{it.prediction.id == prediction.id}.predictedWinner.name}"/>
		<fieldset id="Match${match.id}" class="ui-draggable" style="right: auto; bottom: auto; top: ${match.posY}px; left: ${match.posX}px; position: relative; height: ${hgh}px;">

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
		</fieldset>
	</g:each>
</div>
</div>
</body>
</html>
