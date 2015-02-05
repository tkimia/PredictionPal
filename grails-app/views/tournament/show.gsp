
<%@ page import="predictionpal.Tournament" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tournament.label', default: 'Tournament')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tournament" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tournament" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tournament">
			
				<g:if test="${tournamentInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="tournament.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${tournamentInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tournamentInstance?.owner}">
				<li class="fieldcontain">
					<span id="owner-label" class="property-label"><g:message code="tournament.owner.label" default="Owner" /></span>
					
						<span class="property-value" aria-labelledby="owner-label"><g:fieldValue bean="${tournamentInstance}" field="owner"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tournamentInstance?.hasScores}">
				<li class="fieldcontain">
					<span id="hasScores-label" class="property-label"><g:message code="tournament.hasScores.label" default="Has Scores" /></span>
					
						<span class="property-value" aria-labelledby="hasScores-label"><g:formatBoolean boolean="${tournamentInstance?.hasScores}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${tournamentInstance?.hasSeeds}">
				<li class="fieldcontain">
					<span id="hasSeeds-label" class="property-label"><g:message code="tournament.hasSeeds.label" default="Has Seeds" /></span>
					
						<span class="property-value" aria-labelledby="hasSeeds-label"><g:formatBoolean boolean="${tournamentInstance?.hasSeeds}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${tournamentInstance?.matches}">
				<li class="fieldcontain">
					<span id="matches-label" class="property-label"><g:message code="tournament.matches.label" default="Matches" /></span>
					
						<g:each in="${tournamentInstance.matches}" var="m">
						<span class="property-value" aria-labelledby="matches-label"><g:link controller="match" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${tournamentInstance?.predictions}">
				<li class="fieldcontain">
					<span id="predictions-label" class="property-label"><g:message code="tournament.predictions.label" default="Predictions" /></span>
					
						<g:each in="${tournamentInstance.predictions}" var="p">
						<span class="property-value" aria-labelledby="predictions-label"><g:link controller="prediction" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${tournamentInstance?.state}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><g:message code="tournament.state.label" default="State" /></span>
					
						<span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${tournamentInstance}" field="state"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:tournamentInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${tournamentInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
