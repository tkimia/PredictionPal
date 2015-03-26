<html>
<head>
	<title>
	${ tournament.title } Results
	</title>
	<meta name="layout" content="main"/>
</head>

<body>
	<g:form action="getResults" id="ResultsForm">
		<fieldset id="general-details">
			<g:hiddenField name="tournamentName" value="${tournament.title}"/>
			<legend>Results for ${ tournament.title }</legend>
			<a href="http://localhost:8080/PredictionPal/tournament/tournamentResults/${tournament.sid}">Tournament Results</a>
			<g:hiddenField name="sid" value="${tournament.sid}"/>
			<g:hiddenField name="toLookAt" value="0"/>
			<br />

		</fieldset>

		<div id="listPreds">
		<fieldset>

			<legend>Participants</legend>
			<g:each var="Preds" in="${tournament.predictions.sort {it.predPoints}}">
				<div id="Pred${Preds.id}">
				<a class="goTo">${Preds.name}</a> ${Preds.predPoints}
				<p hidden=true class="predId">${Preds.id}</p>
				<p hidden=true class="TournSid">${tournament.sid}</p>
				</div>
			</g:each>
			</fieldset>
		</div>
	</g:form>

	<script type="text/javascript">
		jQuery(document).ready(function(){
			var form_ref = $("#listPreds");
			var view_button = $(".goTo");


			$(view_button).click(function(e) {
				//e.preventDefault();
				var parentDiv = $(this).parent("div");
				var predictionId = parentDiv.find(".predId").text();
				var url = "http://localhost:8080/PredictionPal/tournament/viewPrediction/" + predictionId;
				window.location = url;
			}); //End remove button

		}); //End script

	</script>
</body>