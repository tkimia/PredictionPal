package predictionpal

class Match {
	static belongsTo = [tournament: Tournament]
	static hasMany = [prevMatches: Match, teams: Team, matchPredictions: MatchPrediction]
	Match nextMatch
	WinTeam winner
	int posX, posY
	
	static mappedBy = [ prevMatches: "nextMatch"] //prevmatches on this obj defined by next on other obj


	
	String toString() {
		String result = "";
		int i = 0;
		for (Team T in teams){
			if(i != 0){
				result = result + " vs "
			}
			result = result + T
			i++
		}
		i = 1;
		if (result.equals("")){
			def prevList = prevMatches.toArray()
			while(prevList.size() > 0){
				Match prev = prevList[0]
				i++
				prevList=prev.prevMatches.toArray()
			}
			result = "Round " + i + " empty match"
		}
		return result;
	}
	
    static constraints = {
    	nextMatch nullable: true
		winner nullable: true
		matchPredictions nullable: true
		posX nullable: true
		posY nullable: true
    }

}
