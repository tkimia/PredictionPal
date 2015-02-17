<html>
<head>
	<title> Create a new Tournamnet </title>
	<meta name="layout" content="main" />
</head>

<body>
	<h1> Create a new tournament </h1>

	<g:form action="packTournament" >

		<fieldset>	
			<legend>Overview Information</legend>
			
			<label for="title">Title</label>
			<g:textField name="title" />
			<br />
			<label for="owner">Your Name</label>
			<g:textField name="owner" />
			<br />
			<label for="hasSeeds">Use Seeds?</label>
			<g:checkBox name="hasSeeds" />
			<br />
			<label for="hasScores">Include Scores?</label>
			<g:checkBox name="hasScores" />
			<br />
			<g:submitButton name="post" value="Create Tournament" /> 
		</fieldset>

		<a> Add match </a>

	</g:form>

</body>
</html>