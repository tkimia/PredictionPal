<html>
<head>
	<title>
	Predict for ${ tournament.title }
	</title>
	<meta name="layout" content="main"/>
</head>

<body>
	<g:form action="lookAtPredictions" id="currentPredicionsForm">
		<fieldset id="general-details">
			<g:hiddenField name="tournamentName" value="${tournament.title}"/>
			<legend>Current Predictions For ${ tournament.title }</legend>
			<g:hiddenField name="sid" value=${tournament.sid}/>
			<g:hiddenField name="toBeRemoved" value=0/>
			<br />

		</fieldset>

		<div id="listPreds">
		<fieldset>

			<legend>Participants</legend>
			<g:each var="Preds" in="${tournament.predictions.sort {it.id}}">
				<div id="Pred${Preds.id}">
				${Preds.name} <a class="removePred">Remove Prediction</a>
				</div>
			</g:each>
			</fieldset>
		</div>
	</g:form>
	
	<script type="text/javascript">
		jQuery(document).ready(function(){
			var form_ref = $("#listPreds");
			var remove_button = $(".removePred");

			$(remove_button).click(function(e) {
				e.preventDefault();
				

			}); //End remove button
				
		}); //End script

	</script>
</body>
