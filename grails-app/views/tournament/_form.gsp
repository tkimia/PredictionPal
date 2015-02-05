<%@ page import="predictionpal.Tournament" %>



<div class="fieldcontain ${hasErrors(bean: tournamentInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="tournament.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${tournamentInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tournamentInstance, field: 'owner', 'error')} required">
	<label for="owner">
		<g:message code="tournament.owner.label" default="Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="owner" required="" value="${tournamentInstance?.owner}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tournamentInstance, field: 'hasScores', 'error')} ">
	<label for="hasScores">
		<g:message code="tournament.hasScores.label" default="Has Scores" />
		
	</label>
	<g:checkBox name="hasScores" value="${tournamentInstance?.hasScores}" />

</div>

<div class="fieldcontain ${hasErrors(bean: tournamentInstance, field: 'hasSeeds', 'error')} ">
	<label for="hasSeeds">
		<g:message code="tournament.hasSeeds.label" default="Has Seeds" />
		
	</label>
	<g:checkBox name="hasSeeds" value="${tournamentInstance?.hasSeeds}" />

</div>

<div class="fieldcontain ${hasErrors(bean: tournamentInstance, field: 'matches', 'error')} ">
	<label for="matches">
		<g:message code="tournament.matches.label" default="Matches" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tournamentInstance?.matches?}" var="m">
    <li><g:link controller="match" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="match" action="create" params="['tournament.id': tournamentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'match.label', default: 'Match')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: tournamentInstance, field: 'predictions', 'error')} ">
	<label for="predictions">
		<g:message code="tournament.predictions.label" default="Predictions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tournamentInstance?.predictions?}" var="p">
    <li><g:link controller="prediction" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="prediction" action="create" params="['tournament.id': tournamentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'prediction.label', default: 'Prediction')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: tournamentInstance, field: 'state', 'error')} required">
	<label for="state">
		<g:message code="tournament.state.label" default="State" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="state" type="number" value="${tournamentInstance.state}" required=""/>

</div>

