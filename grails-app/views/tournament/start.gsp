<html>
<head>
	<title> Create a new Tournamnet </title>
	<meta name="layout" content="main" />
</head>

<body>
	<h1> Create a new tournament </h1>

	<g:form action="packTournament" id="tournamentForm">

		<fieldset id="overview-fieldset">	
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
			
			<g:hiddenField name="numMatches" value="0" />
		</fieldset>

		<div id="formMatches">

			<fieldset id="matchA">
				<legend> Match A </legend>
				<label for="matchANext">Next Match Letter</label>
				<g:textField name="matchANext" />

			</fieldset>

		</div>

		<g:submitButton name="post" value="Create Tournament" />
	</g:form>
	<a class="addNewMatch"> Add match </a>

	<script type="text/javascript">
		jQuery(document).ready( function() {
			var max_teams	= 10;
			var form_ref = $("#formMatches");
			var add_button = $(".addNewMatch");
			
			var matches = 1;

			$(add_button).click(function(e) {
				e.preventDefault();
				var matchChar = String.fromCharCode(65+matches);
				matches++;

				$(form_ref).append(
					'<fieldset id="match'+ matchChar +'">' +
						'<legend> Match '+ matchChar +' </legend>' +
						'<label for="match'+ matchChar + 'Next">Next Match Letter</label>' +
						'<g:textField name="match'+ matchChar +'Next" />' +
					'</fieldset>'
					);

			}); //end add_button click

		} );
	</script>

</body>
</html>