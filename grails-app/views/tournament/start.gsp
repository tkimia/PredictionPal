<html>
<head>
	<title> Create a new Tournament </title>
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

		#overview-fieldset legend {
		    background: #000;
		    color: #fff;
		    padding: 5px 10px ;
		    font-size: 32px;
		    border-radius: 5px;
		    box-shadow: 0 0 0 5px #a34949;
		    margin-left: 20px;
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
	 <script>
		$(function() {
			$( "#formMatches fieldset" ).draggable({ containment: "parent", snap: true, grid: [20,20],
				 stop: function() {
					var mLetter = $(this).attr('id').slice(-1);
					var posx = $("#match"+mLetter).css("left").replace(/[^-\d\.]/g, '');
					var posy = $("#match"+mLetter).css("top").replace(/[^-\d\.]/g, '');
					$("#match"+mLetter+"PosY").attr("value", posx);
					$("#match"+mLetter+"PosX").attr("value", posy);
					
				}
			 });
		});
	</script>	
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

		<div id="add-remove-match-buttons">
			<a class="addNewMatch"> Add match </a>
			<span>  |  </span>
			<a class="removeMatch"> Remove match </a>
		</div>

		<div id="matches-container">
		<div id="formMatches">
			<fieldset id="matchA">
				<legend> Match A </legend>
				<g:hiddenField name="matchATeams" value="0"/>
				<g:hiddenField name="matchAPosX" value="20"/> 
				<g:hiddenField name="matchAPosY" value="5"/>  
				<label for="matchANext">Next Match Letter</label>
				<g:textField name="matchANext" size="1" maxlength="1" />
				<br />
				<a class="addTeam"> Add Team </a>
				<span>  |  </span>
				<a class="removeTeam">Remove Team </a>
			</fieldset>

		</div>
		</div>


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
			var hasSeeds = false;

			$("#matchATeams").val(0); //fixed saved value bug
			$("#numMatches").val(1);
			$("#hasSeeds").prop('checked', false);

			$(add_button).click(function(e) {
				e.preventDefault();
				var matchChar = String.fromCharCode(65+matches);
				//var newTextBox = $(document.createElement('div')).attr("id", 'Match' + matchChar)
				matches++;
				
				$(form_ref).append(
					'<fieldset id="match'+ matchChar +'">' +
						'<legend> Match '+ matchChar +' </legend>' +
						'<input id = "match' + matchChar + 'Teams" type="hidden" value="0" name="match' + matchChar + 'Teams"></input>' +
						'<input name="match' + matchChar + 'PosX" value="20" id="match' + matchChar + 'PosX" type="hidden">' +
						'<input name="match' + matchChar + 'PosY" value="20" id="match' + matchChar + 'PosY" type="hidden">' +
						'<label for="match'+ matchChar + 'Next">Next Match Letter</label>' +
						'<input id = "match' + matchChar + 'Next" size="1" maxlength="1" type="text" value="" name="match' + matchChar + 'Next"></input>'	+
						'<br />' +
						'<a class="addTeam"> Add Team </a>'+
						'<span>  |  </span>'+
						'<a class="removeTeam">Remove Team </a>' +
					'</fieldset>'
					);

				//newTextBox.appendTo(form_ref);
				$(hidden_num_matches).val(matches);
				
			$( "#formMatches fieldset" ).draggable({ containment: "parent", snap: true, grid: [20,20],
				 stop: function() {
					var mLetter = $(this).attr('id').slice(-1);
					var posx = $("#match"+mLetter).css("left").replace(/[^-\d\.]/g, '');
					var posy = $("#match"+mLetter).css("top").replace(/[^-\d\.]/g, '');
					$("#match"+mLetter+"PosY").attr("value", posx);
					$("#match"+mLetter+"PosX").attr("value", posy);
					
				} });
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

				$(this).parent('fieldset').height($(this).parent('fieldset').height() + 25);

				if (hasSeeds) {
					$(this).parent('fieldset').append(
						'<div> \
							<input name="match'+mLetter+'Team'+teams+'seed" value="" id="match'+mLetter+'Team'+teams+'seed" type="number" > \
							<input name="match'+mLetter+'Team'+teams+'" value="" id="match'+mLetter+'Team'+teams+'" type="text" placeholder="Team name"> \
						</div>'
						 );
				}
				else {
					$(this).parent('fieldset').append(
						'<div> \
							<input name="match'+mLetter+'Team'+teams+'" value="" id="match'+mLetter+'Team'+teams+'" type="text" placeholder="Team name"> \
						</div>'
					);
				}
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

				$(this).parent('fieldset').height($(this).parent('fieldset').height() -25);
			

			}); //end remove_team click

			$("#hasSeeds").click( function(e) {
				hasSeeds = this.checked;
				if (hasSeeds) {
					$("input:text").filter(function() {
        				return this.id.match(/match[A-Z]Team[0-9]*/);
    				}).before(
    					'<input name="'+$(this).prop('name')+'seed" value="" id="'+$(this).prop('name')+'seed" type="number" size="4" style="font-family:monospace">'
    				);
				} else {
					$("input:text").filter(function() {
        				return this.id.match(/match[A-Z]Team[0-9]*/);
    				}).prev().remove();
				}
			});

		} ); //end script

	</script>

</body>
</html>