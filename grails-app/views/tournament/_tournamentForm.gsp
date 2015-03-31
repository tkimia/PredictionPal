	<g:form action="updateTournament" id="updateForm">
		<table id="show-tournament">
				<tr>
					<%= starters %>
					<g:while test="${!starters.isEmpty()}">
					<td>
						<g:each var="match" in="${starters}">
							<div id="Match${match.id}" class="drawn-match">

							<g:if test="${match.nextMatch}">
								<p hidden="true" class="nextinfo">${match.nextMatch.id}</p>
							</g:if>
							<g:else>
								<p hidden="true" class="nextinfo">NULL</p>
							</g:else>

							<g:if test="${match.winner}">
								<p>Winner: ${match.winner}</p>
								<g:each var="team" in="${match.teams.sort {it.id}}">
									<p>${team.name}</p>
								</g:each>
								<br/>
							</g:if>
							<g:else>
								<g:each var="team" in="${match.teams.sort {it.id}}">
									<div class="choice">
									<input type="radio" name="${match.id}"
										value="${team.name}" > ${team.name} 
								
									<g:if test="${tournament.hasScores}">
										<g:textField name="scores${match.id}" />
									</g:if>
									</div>
								</g:each>
							</g:else>

							</div>

						
						</g:each>
							<% nexters = starters.groupBy {
							    it.nextMatch
								}
								starters = nexters.keySet();
							%>
							
					</td>
					</g:while>
			</tr>
		</table>

	</g:form>