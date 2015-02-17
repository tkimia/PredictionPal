package predictionpal

class Match {
	static belongsTo = [tournament: Tournament]
	static hasMany = [prevMatches: Match, teams: Team, matchPredictions: MatchPrediction]
	Match nextMatch

	static mappedBy = [ prevMatches: "nextMatch"] //prevmatches on this obj defined by next on other obj

	Team winner

    static constraints = {
    	nextMatch nullable: true
		winner nullable: true
		matchPredictions nullable: true
    }

}