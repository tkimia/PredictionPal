<%@ page import="predictionpal.Tournament" %>

<script type="text/javascript">

jQuery(document).ready( function() {


	function updateNames($tbody) {
		
		$tbody.find('tr').each(function (idx) {
			var $inp = $(this).find('input,select');
			$(this).attr('rowId', idx);
			$inp.each(function () {
				this.name = this.name.replace(/(\[\d\])/, '[' + idx + ']');
			})
		});
	}

	$(document).on("click", ".deleteMatch",function(event) {

		var tableBody = $('#matchesListTableBody');
		var rowToDelete = $(this).closest('tr');
		$(rowToDelete).remove();
		updateNames(tableBody);
		return false;
	});

	$('.addNewMatch').click( function() {
		var allMatches = $("#matchesListTableBody tr[rowId]");
		var rowId = 0;
	
		if( allMatches.length ) {
			var maxId = 0;
			allMatches.each(function() {
				maxId = Math.max(maxId, parseInt($(this).attr('rowId')));
			});
			rowId = maxId+1;
		}
		$("#matchesListTableBody").append( '<tr newRow="true" rowId="' + rowId + '">' +	
		'<td class="moveRow"><a href="#" class="deleteMatch">Delete match</a></td><td class="moveRow">Move</td></tr>');
		return false;
	});

});

</script>


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
	<table id="matchesList">
		<thead>
			<tr>
				<th>Delete</th>
				<th>Move</th>
			</tr>
		</thead>
		<tbody id="matchesListTableBody">
		<g:each in="${tournamentInstance.matches}" var="matches" status="i">
			<tr <g:if test="${!match?.id}">newRow="true"</g:if> rowId="${i}">
				<td>
					<a href="#" class="deleteMatch">Delete match</a>
				</td>		
				<td class="moveRow">
					Move
				</td>		
			</tr>
		</g:each>
		</tbody>
	</table>
	<a href="#" class="addNewMatch">Add new match</a>
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

