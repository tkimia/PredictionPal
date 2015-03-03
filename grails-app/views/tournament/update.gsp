<html>
<head>
	<title>
	Update ${ tournament.title }
	</title>
	<meta name="layout" content="main"/>
</head>
<body>
	<g:form action="updateTournament" id="updateForm">
		<fieldset id="general-details">
			<g:hiddenField name="tournamentName" value="${tournament.title}"/>
			<legend>Update ${ tournament.title }</legend>

		</fieldset>

		<div id="formMatches">
		<fieldset>

		<legend>Select Match Winners</legend>
		<g:each var="match" in="${tournament.matches.sort {it.id}}">
			<div id="Match${match.id}">
				<g:if test="${match.nextMatch}">
					<p hidden="true" class="nextinfo">${match.nextMatch.id}</p>
				</g:if>
				<g:else>
					<p hidden="true" class="nextinfo">NULL</p>
				</g:else>
				<g:if test="${match.winner}">
					<p>Winner: ${match.winner}</p>
					<g:each var="team" in="${match.teams.sort {it.id}}">
						<p>${team.name}</p>
					</g:each>
					<br/>
				</g:if>
				<g:else>
					<g:each var="team" in="${match.teams.sort {it.id}}">
						<input type="radio" name="${match.id}"
							value="${team.name}">${team.name}<br/>
						<g:if test="${tournament.hasScores}">
							<g:textField name="scores${match.id}" />
						<br/>
						</g:if>
					</g:each>
					<br/>
				</g:else>
			</div>
			<br/>
		</g:each>
		<g:submitButton name="post" value="Update Tournament"/>

		</fieldset>
		</div>
	</g:form>
	<script type="text/javascript">
		jQuery(document).ready( function() {

			$('body').on('click', 'input:radio', function() {
    			var team_name_str = $(this).attr('value');
				var parentMatch = $(this).parent("div");
				var curname = $(this).attr('name');

				console.log(curname)
				var child = parentMatch.find(".nextinfo").text();

				if(child!="NULL"){
					var teamName = $(this).val();
					if(${tournament.hasScores} == true){
					$("#Match"+child).append(
						'<input name="'+child+'" value="'+team_name_str+'" type="radio">' +
						team_name_str + '<br/>' +
						'<input name= scores'+child+'" value="'+""+ '"type="text">'+
						'<br/>'

					);
				}else{
					$("#Match"+child).append(
						'<input name="'+child+'" value="'+team_name_str+'" type="radio">' +
						team_name_str +
						'<br/>'

					);
				}
				}
			});

		});
	</script>
</body>
</html>