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
	<div id="frontpagePic" align=center <a href="/PredictionPal/tournament/frontpage"><asset:image src="frontpagePic.jpg" alt="Grails"/></a></div>
	<div id="debug" align=center><a href="/PredictionPal/">Debug</a></div>
	<div id="helpPage" align=center><a href="/PredictionPal/help">Help</a></div>
	<div id="CreateTournament" align=center><a href="/PredictionPal/tournament/create">Create Tournament</a></div>
	<div align=center>Please enter the ssid to predict: <input type="text" name="ssidInput" id="ssidInput" value="color"><input type="button" value="Submit" onclick="location.href='/PredictionPal/tournament/predict/'+document.getElementById('ssidInput').value"></div>

<footer><br><br><br><br><br><div align=right> graphic original source: http://freedesignfile.com/upload/2012/09/champion-2.jpg</div></footer>

</body>
</html>