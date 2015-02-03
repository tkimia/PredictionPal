package predictionpal

class Match {
	static belongsTo = [tournament: Tournament]
	static hasMany = [prevMatches: Match]
	Match nextMatch

	static mappedBy = [ prevMatches: "nextMatch"] //prevmatches on this obj defined by next on other obj
					  
	//static hasMany = [teams: Team]
	//Team winner

    static constraints = {
    	nextMatch nullable: true
    }


}
