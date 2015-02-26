<html>
<head>
	<title>
	Predict for ${ tournament.title }
	</title>
	<meta name="layout" content="main"/>
</head>
<body>
	<g:form method="post" action="packPredictions">
		<fieldset id="general-details">
			<g:hiddenField name="tournamentName" value="${tournament.title}"/>
			<legend>Predict for ${ tournament.title }</legend>

			<label for="name">Name</label>
			<g:textField name="name" />
			<br />

			<label for="email">Email</label>
			<g:textField name="email" />
			<br />

		</fieldset>

		<div id="formMatches">
		<fieldset>

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
		<g:submitButton name="packPredictions" value="Make Predictions"/>

		</fieldset>
	</div>
	</g:form>

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
				$(this).prop('checked',true)
				var parentMatch = $(this).parent("div");
				var curname = $(this).attr('name');
				console.log(curname)
				var child = parentMatch.find(".nextinfo").text();
				var clo = $(this).clone();
				clo.attr('name', child);
				$(this).prop('checked',true)
				if(child!="NULL"){
					var teamName = $(this).val();
					$("#Match"+child).append(clo);
					$("#Match"+child).append(teamName+'<br/>');
				}

			});
//end remove_button click
		});
	</script>
</body>
</html>
