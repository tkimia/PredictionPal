
<%@ page import="predictionpal.Tournament" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tournament.label', default: 'Tournament')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tournament" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tournament" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'tournament.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="owner" title="${message(code: 'tournament.owner.label', default: 'Owner')}" />
					
						<g:sortableColumn property="hasScores" title="${message(code: 'tournament.hasScores.label', default: 'Has Scores')}" />
					
						<g:sortableColumn property="hasSeeds" title="${message(code: 'tournament.hasSeeds.label', default: 'Has Seeds')}" />
					
						<g:sortableColumn property="state" title="${message(code: 'tournament.state.label', default: 'State')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tournamentInstanceList}" status="i" var="tournamentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tournamentInstance.id}">${fieldValue(bean: tournamentInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: tournamentInstance, field: "owner")}</td>
					
						<td><g:formatBoolean boolean="${tournamentInstance.hasScores}" /></td>
					
						<td><g:formatBoolean boolean="${tournamentInstance.hasSeeds}" /></td>
					
						<td>${fieldValue(bean: tournamentInstance, field: "state")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tournamentInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
