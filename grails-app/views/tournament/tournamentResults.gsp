<html>
<head>
	<title>Results for Tournament ${tournament.title}</title>
	<meta name="layout" content="main"/>
</head>
<body>
	<g:if test="${tournament.state==3}">
	<h1>Results for the ${tournament.title} tournament</h1>
	<g:each var="match" in="${tournament.matches.sort {it.id}}">
		<g:each var="team" in="${match.teams}">
			<g:if test="${team.name == match.winner.name}">
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