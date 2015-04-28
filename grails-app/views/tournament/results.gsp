<html>
<head>
	<title>
	${ tournament.title } Results
	</title>
	<meta name="layout" content="main"/>
	<!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">

      // Load the Visualization API and the piechart package.
      google.load('visualization', '1.0', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['${tournament.title}', 3],
          ['Onions', 1],
          ['Olives', 1],
          ['Zucchini', 1],
          ['Pepperoni', 2]
        ]);

        // Set chart options
        var options = {'title':'How Much Pizza I Ate Last Night',
                       'width':400,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>

</head>

<body>
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
	<div id="chart_div"></div>


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
