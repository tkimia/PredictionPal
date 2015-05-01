<html>
<head>
	<title>
	<g:cookie name='username' />
	</title>
	<meta name="layout" content="main"/>
</head>

<body>
	<div id="userMade">
		<h2>Your Tournaments</h2> Tournament Title - - - Tournament Code <br/><br/>
		<g:each var="Tourns" in="${user.tournaments.sort {it.id}}">
			<div id="Tourn${Tourns.id}">
			${Tourns.title} --- ${Tourns.sid}
			</div>
		</g:each>
	</div>
	<br/>
	<div id="userOwned">
		<h2> Your Predictions</h2>     Tournament Title<br/><br/>
		<g:each var="Preds" in="${user.predictions.sort {it.id}}">
			<div id="Pred${Preds.id}">
			${Preds.tournament.title}
			</div>
		</g:each>
		</div>


	<script type="text/javascript">
		//jQuery(document).ready(function(){
		//	var form_ref = $("#listPreds");
		//	var view_button = $(".goToPred");
		//	var view_tourn = $(".goToTourn");


		//	$(view_button).click(function(e) {
				//e.preventDefault();
		//		var parentDiv = $(this).parent("div");
		//		var predictionId = parentDiv.find(".predId").text();
		//		var url = "http://localhost:8080/PredictionPal/prediction/show/" + predictionId;
			//	window.location = url;
	//		}); //End remove button
//
	//		$(view_button).click(function(e) {
		//		//e.preventDefault();
			//	var parentDiv = $(this).parent("div");
				//var TournId = parentDiv.find(".tournId").text();
//				var url = "http://localhost:8080/PredictionPal/tournament/show/" + predictionId;
	//			window.location = url;
		//	}); //End remove button

		//}); //End script

	</script>
</body>