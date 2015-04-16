<html>
<head>
	<title>
	Predict for ${ tournament.title }
	</title>
	<meta name="layout" content="main"/>
	<style>
		fieldset {
	    font-family: sans-serif;
	    border: 5px solid #A34949;
	    background: none repeat scroll 0% 0% #DDD;
	    border-radius: 5px;
	    padding: 15px;
		}
		#formMatches fieldset{
			width: 250px;
			border: 3px solid #a34949;
		    padding: 10px;
		    height: 75px;
		    margin: 5px;
		}

		#formMatches fieldset legend{
			background: #000;
		    color: #fff;
		    box-shadow: 0 0 0 3px #a34949;
		}

		#matches-container {
			overflow-x: scroll;
			padding: 5px;

		}

		#formMatches {
			height: 550px;
			width: 1250px;
			background: #fff;
			border: 5px black;
		}
	</style>
</head>
<body>
	<g:if test="${isManager}">
		<div id="owner-box">
			<h2> Welcome back ${tournament.owner} </h2>

			<p> On this page you can update the actual tournament status and see predictions that users have submitted </p>
		</div>
	</g:if>


	<g:if test="${tournament.state == 1 || isManager}">
		<g:form action="packPredictions" id="predictionForm">

		<g:if test="${!isManager}">
			<h2> Enter your Prediction </h2>
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
		</g:if>
		<g:else>
			<h2> Update the results of this tournament </h2>
		</g:else>

			<div id="matches-container">
					<h1>Enter a Prediction</h1>
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
						<g:each var="team" in="${match.teams.sort {it.id}}">
							<input type="radio" name="${match.id}"
							value="${team.name}">${team.name}<br/>
							<g:if test="${tournament.hasScores}">
								<g:textField name="scores${match.id}" /><br/>
							</g:if>
						</g:each>

					</fieldset>
					</g:each>
				
				</div>
					<g:submitButton name="post" value="Make Predictions"/>
			</div>
		</g:form>
	</g:if>
	<g:else>
		<h1>Sorry! This tournament is no longer accepting predictions.</h1>
	</g:else>

	
	<div id="remove-predictions">
		<h2> Current Predictions for this Tournament </h2>

		<ul id="listPreds">
			<g:each var="Preds" in="${tournament.predictions.sort {it.id}}">
				<li id="Pred${Preds.id}">
					${Preds.name} <a class="removePred">Remove Prediction</a>
					<p hidden=true class="predId">${Preds.id}</p>
					<p hidden=true class="TournSid">${tournament.sid}</p>
				</li>
			</g:each>
		</ul>
	</div>


	<script type="text/javascript">
		jQuery(document).ready( function() {

			$('body').on('click', 'input:radio', function() {
    			var team_name_str = $(this).attr('value');
				var parentMatch = $(this).parent("fieldset");
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
