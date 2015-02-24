<html>
<head>
	<title>
	Predict for ${ tournament.title } 
	</title>
	<meta name="layout" content="main"/>
</head>
<body>
	<h1>Predict for ${ tournament.title } </h1>

	<div id="formMatches">
	<formset>
		<g:form method="post" action="addPrediction">
		<legend>Enter a Prediction</legend>
		<g:each var="match" in="${tournament.matches.sort {it.id}}">
			<g:if test="${match.prevMatches.isEmpty()}">
				<div id="${match.id}A">
					<p class="nextinfo"> put next info here </p>
				<g:each var="team" in="${match.teams.sort {it.id}}">	
					<input type="radio" name="${match.id}" 
						value="${team.name}" />${team.name}<br/>
				</g:each>
				<br/>
				</div>
			</g:if>	
			<g:else>
					<input type="radio" name="${match.id}"
					checked="${false}" disabled="${true}"/><br/>
			</g:else>
			<br/>
		</g:each>
		<g:submitButton name="addPredictions" value="Make Predictions"/>
		</g:form>
	</formset>
</div>


	<script type="text/javascript">
		jQuery(document).ready( function() {
			var max_teams	= 10;
			var form_ref = $("#formMatches");
			var add_button = $(".addNewMatch");
			var remove_button = $(".removeMatch");
			var hidden_num_matches = $("#numMatches");
			var matches = 1;

			$("input:radio").click(function(e) {
				e.preventDefault();

				var parentMatch = $(this).parent("div");
				parentMatch.child(".nextinfo").value()

			})
//end remove_button click
		});
	</script>
</body>
</html>