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
	<fieldset>
		<g:form method="post" action="addPrediction">
		<legend>Enter a Prediction</legend>
		<g:each var="match" in="${tournament.matches.sort {it.id}}">
			<div id="Match${match.id}">
				<g:if test="${match.nextMatch}">
					<p style="visiblity:hidden" class="nextinfo">${match.nextMatch.id}</p>
				</g:if>
				<g:else>
					<p style="visiblity:hidden" class="nextinfo">NULL</p>
				</g:else>
				<g:each var="team" in="${match.teams.sort {it.id}}">	
					<input type="radio" name="${match.id}" 
						value="${team.name}"/>${team.name}<br/>
				</g:each>
				<br/>
			</div>
			<br/>
		</g:each>
		<g:submitButton name="addPredictions" value="Make Predictions"/>
		</g:form>
	</fieldset>
</div>


	<script type="text/javascript">
		jQuery(document).ready( function() {
			var max_teams	= 10;
			var form_ref = $("#formMatches");
			var add_button = $(".addNewMatch");
			var remove_button = $(".removeMatch");
			var hidden_num_matches = $("#numMatches");
			var matches = 1;

			$("input:radio").change(function(e) {
				//e.preventDefault();
				
				var parentMatch = $(this).parent("div");
				var child = parentMatch.find(".nextinfo").text();
				if(child!="NULL"){
					//console.log($(this).clone());
					var teamName = this.value;
					$("#Match"+child).append($(this).clone())+'<p>'+teamName+'</p>'+'<br/>';
				}
			});
//end remove_button click
		});
	</script>
</body>
</html>