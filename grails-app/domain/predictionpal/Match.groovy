package predictionpal

class Match {
	static belongsTo = [tournament: Tournament]
	static hasMany = [prevMatches: Match, teams: Team]
	Match nextMatch
	boolean deleted //need for dynamic form
	Team winner

	static mappedBy = [ prevMatches: "nextMatch"] //prevmatches on this obj defined by next on other obj
					  
	static transients = ['deleted'] //need for dynamic form

    static constraints = {
    	nextMatch nullable: true
    	winner nullable: true
    	teams cascade:"all-delete-orphan"
    }

}
