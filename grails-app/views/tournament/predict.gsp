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
	<g:if test="${tournament.state == 1}">
		<g:form action="packPredictions" id="predictionForm">

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

			<div id="matches-container">
			<div id="formMatches">
	

					<h1>Enter a Prediction</h1>
					
					<g:each var="match" in="${tournament.matches.sort {it.orderchar}}">

					<g:set var="hgh" value="${75 + match.teams.size() * 25} "/> 

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
				
				<g:submitButton name="post" value="Make Predictions"/>

					
				</div>
			</div>
		</g:form>
	</g:if>
	<g:else>
		<h1>Sorry! This tournament is no longer accepting predictions.</h1>
	</g:else>

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

		});
	</script>
</body>
</html>
