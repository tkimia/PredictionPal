<html>
<head>
	<title>Prediction Pal</title>
	<meta name="layout" content="main" />
</head>
<body>
	<g:form controller="tournament" action="index_display">
				<g:each in="${tournaments}" var="tournament">
				<g:if test="${tournament.promotions == true}">
					${tournament.title}
				</g:if>
					<br/>
				</g:each>
	</g:form>
</body>