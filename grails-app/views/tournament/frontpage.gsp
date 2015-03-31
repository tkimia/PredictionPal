<html>
<head>
	<title> Welcome To Prediction Pal! </title>
	<meta name="layout" content="main" />
	<style>
		fieldset {
		    font-family: sans-serif;
		    border: 5px solid #a34949;
		    background: #ddd;
		    border-radius: 5px;
		    padding: 15px;
		}

		fieldset legend {
		    background: #000;
		    color: #fff;
		    padding: 5px 10px ;
		    font-size: 32px;
		    border-radius: 5px;
		    box-shadow: 0 0 0 5px #a34949;
		    margin-left: 20px;
		}
	</style>
	 <script>
		
	</script>	
</head>
<body>
	
	<div id="debug"><a href="/PredictionPal/">Debug</a></div>
	<div id="helpPage"><a href="/PredictionPal/help">Help</a></div>
	<div id="CreateTournament"><a href="/PredictionPal/tournament/create">Create Tournament</a></div>
	<div>Please enter the ssid to predict: <input type="text" name="ssidInput" id="ssidInput" value="color"><input type="button" value="Submit" onclick="location.href='/PredictionPal/tournament/predict/'+document.getElementById('ssidInput').value"></div>
	

</body>
</html>