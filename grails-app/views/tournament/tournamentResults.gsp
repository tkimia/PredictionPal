<html>
<head>
	<title>Results for Tournament ${tournament.title}</title>
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
	<g:if test="${tournament.state==3}">
	<h1>Results for the ${tournament.title} tournament</h1>
	<div id="matches-container">
	<div id="formMatches">
	<g:each var="match" in="${tournament.matches.sort {it.orderchar}}">
		<g:set var="hgh" value="${75 + match.teams.size() * 25}"/>
		<g:set var="winnerName" value="${match.winner.name}" />

		<fieldset id="Match${match.id}" class="ui-draggable" style="right: auto; bottom: auto; top: ${match.posY}px; left: ${match.posX}px; position: relative; height: ${hgh}px;">
		<!--Calculating percentage -->
		<g:set var="correctCounter" value="${0}"/>
		<g:each var="prediction" in="${match.matchPredictions}">
		<g:if test="${prediction.predictedWinner.name == winnerName}">
			<g:set var="correctCounter" value="${correctCounter+1}" />
		</g:if>
		</g:each>
		<g:set var="percentage" value="${(correctCounter/match.matchPredictions.size()*100).intValue()}" />
		${percentage}% Predicted Correctly <br />

		<g:each var="team" in="${match.teams.sort {it.id}}">

			<g:if test="${team.name == winnerName}">
			<b>${team.name}</b>
			</g:if>
			<g:else>
	   			${team.name}
			</g:else>
			<br />
			</g:each>
		<br />
	</fieldset>
	</g:each>
	</div>
	</div>
	</g:if>
	<g:else>
		<h1>Tournament ${tournament.title} still in progress!</h1>
	</g:else>

</body>
</html>
