package predictionpal

class Match {
	static belongsTo = [tournament: Tournament, matchPrediction: MatchPrediction]
	static hasMany = [prevMatches: Match, teams: Team]
	Match nextMatch

	static mappedBy = [ prevMatches: "nextMatch"] //prevmatches on this obj defined by next on other obj

	Team winner

    static constraints = {
    	nextMatch nullable: true
		winner nullable: true
    }

}
