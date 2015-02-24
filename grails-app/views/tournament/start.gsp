<html>
<head>
	<title> Create a new Tournamnet </title>
	<meta name="layout" content="main" />
	<!-- TODO: Move this externally -->
	<style>
		fieldset {
		    font-family: sans-serif;
		    border: 5px solid #a34949;
		    background: #ddd;
		    border-radius: 5px;
		    padding: 15px;
		}

		fieldset legend {
		    background: #000;
		    color: #fff;
		    padding: 5px 10px ;
		    font-size: 32px;
		    border-radius: 5px;
		    box-shadow: 0 0 0 5px #a34949;
		    margin-left: 20px;
		}
	</style>
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
			
			<g:hiddenField name="numMatches" value="1" />
		</fieldset>

		<div id="formMatches">

			<fieldset id="matchA">
				<legend> Match A </legend>
				<g:hiddenField name="matchATeams" value="0"/> 
				<label for="matchANext">Next Match Letter</label>
				<g:textField name="matchANext" />
				<br />
				<a class="addTeam"> Add Team </a>
				<span>  |  </span>
				<a class="removeTeam">Remove Team </a>
			</fieldset>

		</div>

		<div id="add-remove-match-buttons">
			<a class="addNewMatch"> Add match </a>
			<span>  |  </span>
			<a class="removeMatch"> Remove match </a>
		<div>
		<br />
		<g:submitButton name="post" value="Create Tournament" />
	</g:form>
	

	<script type="text/javascript">
		jQuery(document).ready( function() {
			var max_teams	= 10;
			var form_ref = $("#formMatches");
			var add_button = $(".addNewMatch");
			var remove_button = $(".removeMatch");
			var hidden_num_matches = $("#numMatches");
			var matches = 1;

			$("#matchATeams").val(0); //fixed saved value bug
			$("#numMatches").val(1);

			$(add_button).click(function(e) {
				e.preventDefault();
				var matchChar = String.fromCharCode(65+matches);
				//var newTextBox = $(document.createElement('div')).attr("id", 'Match' + matchChar)
				matches++;
				$(form_ref).append(
					'<fieldset id="match'+ matchChar +'">' +
						'<legend> Match '+ matchChar +' </legend>' +
						'<input id = "match' + matchChar + 'Teams" type="hidden" value="0" name="match' + matchChar + 'Teams"></input>' +
						'<label for="match'+ matchChar + 'Next">Next Match Letter</label>' +
						'<input id = "match' + matchChar + 'Next" type="text" value="" name="match' + matchChar + 'Next"></input>'	+
						'<br />' +
						'<a class="addTeam"> Add Team </a>'+
						'<span>  |  </span>'+
						'<a class="removeTeam">Remove Team </a>' +
					'</fieldset>'
					);

				//newTextBox.appendTo(form_ref);
				$(hidden_num_matches).val(matches);
			}); //end add_button click


			$(remove_button).click(function(e) {
				e.preventDefault();
				if (matches == 1) return;
				matches--;

				$("#formMatches fieldset:last-child").remove();
				$(hidden_num_matches).val(matches);
			}); //end remove_button click


			$(form_ref).on("click", ".addTeam", function(e) {
				e.preventDefault();

				var mLetter = $(this).parent('fieldset').attr('id').slice(-1);
				
				//make sure there aren't too many teams
				var teams = $("#match" + mLetter + "Teams").val();
				if (teams == max_teams) return;

				//update the number of teams
				teams++;
				$("#match" + mLetter + "Teams").val(teams);

				$(this).parent('fieldset').append(
					'<div> \
						<input name="match'+mLetter+'Team'+teams+'" value="" id="match'+mLetter+'Team'+teams+'" type="text"> \
					</div>'
					);
			}); //end add_team click


			$(form_ref).on("click", ".removeTeam", function(e) {
				e.preventDefault();

				//get letter identifier of the match
				var mLetter = $(this).parent('fieldset').attr('id').slice(-1);

				//get number of teams on this match
				var teams = $("#match" + mLetter + "Teams").val();
				if (teams == 0) return;

				//update the number of teams
				teams--;
				$("#match" + mLetter + "Teams").val(teams);

				//remove last team
				$(this).parent('fieldset').children().last().remove();

			}); //end remove_team click

		} ); //end script

	</script>

</body>
</html>