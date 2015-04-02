<html>
<head>
	<title>Prediction Pal Portal </title>
	<meta name="layout" content="main" />
</head>
<body>

	<h1> Have a tournament code? </h1>

	<g:form controller="tournament" action="portal">

		<fieldset id="code_fieldset">	
			<label for="title">Code</label>
			<g:textField name="code" value="${code}"/>
			<g:submitButton name="portal" value="Go" />
		</fieldset>
	</g:form>
</body>
</html>