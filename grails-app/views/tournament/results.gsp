<html>
<head>
	<title>
	${ tournament.title } Results
	</title>
	<meta name="layout" content="main"/>
	<!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">

      // Load the Visualization API and the piechart package
	  google.load("visualization", "1", {packages: ["corechart"]});

      // Set a callback to run when the Google Visualization API is loaded.
      google.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
		data.addColumn('string', 'Match')
		<g:each var="prediction" in="${tournament.predictions.sort{it.id}}">
			data.addColumn('number', '${prediction.name}');
		</g:each>
		var row = 0;
		<g:each var="match" in="${tournament.matches.sort {it.orderchar}}">
			data.addRow();
			<g:set var="matchName" value="${match.teams.join(' vs. ')}" />

			data.setCell(row, 0, '${matchName}');
			var column = 1;
			<g:set var="winnerName" value="${match.winner.name}" />
			<g:each var="matchPrediction" in="${match.matchPredictions.sort{it.id}}">
				<g:if test="${matchPrediction.predictedWinner.name == winnerName}">
					if (row == 0){
						data.setCell(row, column, 1);
					}
					else {
						data.setCell(row, column, data.getValue(row-1, column) + 1);
					}
				</g:if>
				<g:else>
					if (row == 0){
						data.setCell(row, column, 0);
					}
					else {
						data.setCell(row, column, data.getValue(row-1, column));
					}
				</g:else>
				column++;
			</g:each>
			row++;
		</g:each>

        // Set chart options
        var options = {
			title:'Prediction Scores Over Time',
			vAxis: {title: 'Accumulated Score'},
			isStacked: false,
			animation: {startup: true}
		};


        // Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.SteppedAreaChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>

</head>

<body>
	<g:if test="${tournament.state==3}">
	<table border = 0>
	<tr>
	<td>
	<g:form action="getResults" id="ResultsForm">
		<fieldset id="general-details">
			<g:hiddenField name="tournamentName" value="${tournament.title}"/>
			<legend>Results for ${ tournament.title }</legend>
			<a href="/PredictionPal/tournament/tournamentResults/${tournament.sid}">Tournament Results</a>
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
	</td>
	<td>

	<div id="chart_div" style="width: 700px; height: 400px;"></div>
	</td>
	</tr>
	</table>
	</g:if>
	<g:else>
		<h3>Results unavailable until tournament is finished</h3>
	</g:else>

	<script type="text/javascript">

		jQuery(document).ready(function(){
			var form_ref = $("#listPreds");
			var view_button = $(".goTo");


			$(view_button).click(function(e) {
				//e.preventDefault();
				var parentDiv = $(this).parent("div");
				var predictionId = parentDiv.find(".predId").text();
				/*var url = "http://localhost:8080/PredictionPal/tournament/viewPrediction/" + predictionId;
				window.location = url;*/
				window.location.href = '/PredictionPal/tournament/viewPrediction/' + predictionId;
			}); //End remove button

		}); //End script

	</script>
</body>
