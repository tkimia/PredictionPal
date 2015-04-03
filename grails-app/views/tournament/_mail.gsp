<html>
<head>
	<title>
	${ t.title } Results
	</title>
	<meta name="layout" content="main"/>
</head>
<body>
<p>
	Hello ${p.name}!
Thank you for participating in the ${t.title} tournament. Please find a link below with statistics and match results.

<g:set var="baseaddress" value="http://sslab09.cs.purdue.edu:8080/PredictionPal/tournament/results/" />
<g:set var="linkspecifier" value="${t.sid}"/>

<a href="${baseaddress + linkspecifier}">${baseaddress+linkspecifier}</a>


</body>
</html>
