<html>
<head>
	<title>
	${ user.username }
	</title>
	<meta name="layout" content="main"/>
</head>

<body>
	<g:form action="userTournaments" id="userOwned">
		<fieldset id="general-details">
			<legend> Your tournaments </legend>
			<br />

		</fieldset>

		<div id="listTournaments">
		<fieldset>
			<g:each var="Tourns" in="${user.tournaments.sort {it.id}}">
				<div id="Tourn${Tourns.id}">
				<a class="goTo">${Tourns.name}</a> --- ${Tourns.sid}
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
				var url = "http://localhost:8080/PredictionPal/prediction/show/" + predictionId;
				window.location = url;
			}); //End remove button

		}); //End script

	</script>
</body>