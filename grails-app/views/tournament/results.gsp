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
	  //google.load("visualization", "1", {packages: ["corechart"]});
	  google.load("visualization", "1", {packages: ["corechart"]});

      // Set a callback to run when the Google Visualization API is loaded.
      google.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {


        // Create the data table.
		<g:if test="${tournament.state==3}">
		
		<g:set var="counter" value="${0}" />
		<g:each var="match" in="${tournament.matches.sort{it.orderchar}}">
			<g:set var="keys" value="${new ArrayList()}" />
			var map${counter} = {};
			<g:each var="matchPrediction" in="${match.matchPredictions}">
				<g:set var="predictedWinnerName" value="${matchPrediction.predictedWinner.name}" />
				<g:if test="${!keys.contains(predictedWinnerName)}">
					map${counter}["${predictedWinnerName}"] = 1;
					<g:set var="fakeVariable" value="${keys.add(predictedWinnerName)}" />
				</g:if>
				<g:else>
					map${counter}["${predictedWinnerName}"] = map${counter}["${predictedWinnerName}"] + 1;
				</g:else>
			</g:each>
			var data${counter} = new google.visualization.DataTable();
			data${counter}.addColumn('string', 'Team');
			data${counter}.addColumn('number', 'Populartiy');
			<g:each var="key" in="${keys}">
				data${counter}.addRow(['${key}', map${counter}["${key}"]]);
			</g:each>
			var options${counter} = {
				title: "${match.teams.join(" vs. ")}",
				chartArea: {width:'75%', height:'75%'},
				pieSliceText:'label'
			}
			var chart${counter} = new google.visualization.PieChart(document.getElementById('chart_div${counter}'));
			chart${counter}.draw(data${counter}, options${counter});
			<g:set var="counter" value="${counter + 1}" />

		</g:each>
		}
		//SECOND GRAPH
		/*<g:each var="prediction" in="${tournament.predictions}">
			<g:each var="matchPrediction" in="${prediction.matchPredictions}">
				<g:set var="predictedWinnerName" value="${matchPrediction.predictedWinner.name}" />
				<g:if test="${!keys.contains(predictedWinnerName)}">
					map["${predictedWinnerName}"] = 1;
					<g:set var="fakeVariable" value="${keys.add(predictedWinnerName)}" />
				</g:if>
				<g:else>
					map["${predictedWinnerName}"] = map["${predictedWinnerName}"] + 1;
				</g:else>
			</g:each>
		</g:each>

		var data2 = new google.visualization.DataTable();
      	data2.addColumn('string', 'Team');
      	data2.addColumn('number', 'Populartiy');
		<g:each var="key" in="${keys}">
			data2.addRow(['${key}', map["${key}"]]);
		</g:each>


      var options2 = {
        title: 'Team Popularity',
		chartArea: {width:'90%',height:'90%'},
		pieSliceText: 'label'
      };

      var chart = new google.visualization.PieChart(document.getElementById('chart_div2'));
      chart.draw(data2, options2);
	  </g:if>

      }*/
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
	<table border=0>
	<g:set var="counter2" value="${0}" />
	<g:each var="match" in="${tournament.matches}">

	<tr>
		<td>
			<div id="chart_div${counter2}" style="width: 500px; height: 300px;"></div>
		</td>
	</tr>
	<g:set var="counter2" value="${counter2 + 1}" />
	</g:each>
	</table>
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
