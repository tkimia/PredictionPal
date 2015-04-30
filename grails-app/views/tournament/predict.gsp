<html>
<head>
	<title>
	Predict for ${ tournament.title }
	</title>
	<meta name="layout" content="main"/>
	<asset:stylesheet href="tournament_form.css" />
	<style>
		.removePred {
			color: red;
			font-style: italic;
			cursor: pointer;
		}
	</style>
</head>
<body>
	<g:if test="${isManager}">
		<div id="owner-box">
			<h2> Welcome back ${tournament.owner} </h2>

			<p> On this page you can update the actual tournament status and see predictions that users have submitted </p>

			<h2> Links </h2>
			<p> Send this link to your participants: <em> predictionpal.com${request.forwardURI} </em></p>
			<p> Keep this link for yourself to upodate the tournament with the real winners: <em> predictionpal.com${request.forwardURI}?pass=${tournament.pass}</em></p>
		</div>


		<div id="remove-predictions">
			<h2> Current Predictions for this Tournament </h2>

			<ul id="listPreds">
				<g:if test="${tournament.predictions.size() == 0}">
					<p> No predictions have been made for this tournament </p>
				</g:if>

				<g:each var="Preds" in="${tournament.predictions.sort {it.id}}">
					<li id="Pred${Preds.id}">
						<a href="/PredictionPal/tournament/viewPrediction/${Preds.id}">${Preds.name}</a>  |  <a class="removePred">delete</a>
						<p hidden=true class="predId">${Preds.id}</p>
						<p hidden=true class="TournSid">${tournament.sid}</p>
					</li>
				</g:each>
			</ul>
		</div>
	</g:if>


	<g:if test="${tournament.state == 1 || isManager}">

		<g:form action="${isManager ? 'updateTournament' : 'packPredictions'}" id="predictionForm">

		<g:if test="${!isManager}">
			<h2> Enter your Prediction </h2>
			<fieldset id="general-details">
				<legend>Predict for ${ tournament.title }</legend>
				<g:if test="${cookie(name:'username')=='null' || cookie(name:'username')=='error' || !cookie(name:'username')}">
					<label for="name">Name</label>
					<g:textField name="name" />
					<br />

					<label for="email">Email</label>
					<g:textField name="email" />
					<br />
				</g:if>
				<g:else>
					<label for="name">Name</label>
					<g:textField name="name" value="${cookie(name:'username')}"/>
					<br />
					
					<label for="email">Email</label>
					<g:textField name="email" value="${user.emails}" />
					<br />
				</g:else>
			</fieldset>
		</g:if>
		<g:else>
			<h2> Update the results of this tournament </h2>
		</g:else>
			<g:hiddenField name="tournamentName" value="${tournament.title}"/>

			<div id="matches-container">
			<div id="formMatches">
	

					
					<g:each var="match" in="${tournament.matches.sort {it.orderchar}}">

					<g:set var="hgh" value="${75 + match.teams.size() * 25}"/> 

					<fieldset id="Match${match.id}" class="ui-draggable" style="right: auto; bottom: auto; top: ${match.posY}px; left: ${match.posX}px; position: relative; height: ${hgh}px;">
						<legend> Match ${match.orderchar} </legend>

						<g:if test="${match.nextMatch}">
						<p style="display: none;" class="nextinfo">${match.nextMatch.id}</p>
						</g:if>
						<g:else>
							<p style="display: none;" class="nextinfo">NULL</p>
						</g:else>
						<g:if test="${match.getWinner() != null}">
							<g:each var="team" in="${match.teams.sort {it.id}}">
							<div>
							<g:if test="${match.getWinner().name == team.name}">
								<b>Winner: ${team.name}</b>
							</g:if>
							<g:else>
								${team.name}
							</g:else>
							</div>
							</g:each>
						</g:if>
						<g:else>
							<g:each var="team" in="${match.teams.sort {it.id}}">
								<div>
								<input type="radio" name="${match.id}"
								value="${team.name}">${team.name}
								<g:if test="${tournament.hasScores}">
									<g:textField name="scores${match.id}" size="3" />
								</g:if>
								</div>
							</g:each>
						</g:else>

					</fieldset>
					</g:each>
				
				</div>
					
			</div>
			<g:submitButton name="post" value="${isManager ? 'Update Tournament' : 'Make Prediction' }"/>
		</g:form>
	</g:if>
	<g:else>
		<h1>Sorry! This tournament is no longer accepting predictions.</h1>
	</g:else>



	<script type="text/javascript">
		jQuery(document).ready( function() {

			$('body').on('click', 'input:radio', function() {
    			var team_name_str = $(this).attr('value');
				var parentMatch = $(this).parent().parent();
				var curname = $(this).attr('name');

				
				var child = parentMatch.find(".nextinfo").text();
				console.log(child);

				if(child!="NULL"){
					if ($("#Match"+child).has("#from"+curname).length)
					{
						console.log("boom");
						if (${tournament.hasScores})
							$("#from"+curname).html(							
							'<input name="'+child+'" value="'+team_name_str+'" type="radio">' +
							team_name_str +
							'<input name= scores'+child+'" value="'+""+ '"type="text" size="3">');
						else
							$("#from"+curname).html(							
							'<input name="'+child+'" value="'+team_name_str+'" type="radio">' +
							team_name_str );
					}
					else {
						if(${tournament.hasScores} == true){
							$("#Match"+child).append(
								'<div id="from'+curname+'">' +
								'<input name="'+child+'" value="'+team_name_str+'" type="radio">' +
								team_name_str +
								'<input name= scores'+child+'" value="'+""+ '"type="text" size="3">'+
								'</div>'

							);
						}else{
							$("#Match"+child).append(
								'<div id="from'+curname+'">' +
								'<input name="'+child+'" value="'+team_name_str+'" type="radio">' +
								team_name_str +
								'</div>'

							);
						}
					}
				}
			});

			//code for removing predictions
			var remove_button = $(".removePred");
			$(remove_button).click(function(e) {
				//e.preventDefault();
				var parentDiv = $(this).parent("li");
				var predictionId = parentDiv.find(".predId").text();
				var tournamentSid = parentDiv.find(".TournSid").text();
				console.log("here");
				jQuery.post("../../prediction/delPred?id="+predictionId+"&tou="+tournamentSid);
				parentDiv.fadeOut();
			}); //End remove button

		});
	</script>
</body>
</html>
