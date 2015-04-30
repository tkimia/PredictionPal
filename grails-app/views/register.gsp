<html>
<head>
	<title>
	Registration
	</title>
	<meta name="layout" content="main"/>
</head>

<body>
	<div id="reg-form">
		<g:form controller="user" action="register">
		<h2 align="center">Register</h2>
		<g:if test="${params.s=='1'}">
			<h3 align="center"> Password must be between 6 and 30 characters</h3>
		</g:if>
		<g:elseif test="${params.s=='2'}">
			<h3 align="center"> Passwords must match</h3>
		</g:elseif>
		<g:elseif test="${params.s=='3'}">
			<h3 align="center"> Username in use</h3>
		</g:elseif>
		<g:elseif test="${params.s=='4'}">
			<h3 align="center"> Username must be between 4 and 20 characters</h3>
		</g:elseif>
			<fieldset id="login_fieldset">	
				<g:textField name="user_name" class="reg-button" placeholder="username" required value="${user_name}"/>
				<g:passwordField name="pass_word1" class="reg-button" placeholder="password" required value="${pass_word1}"/>
				<g:passwordField name="pass_word2" class="reg-button" placeholder="repeat password" required value="${pass_word2}"/>
				<g:submitButton name="register" id="regi-ster" value="register" />
			</fieldset>
		</g:form>
	</div>
	<script type="text/javascript">
		jQuery(document).ready(function(){

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