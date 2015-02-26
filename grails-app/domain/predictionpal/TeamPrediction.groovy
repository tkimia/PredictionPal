package predictionpal

class TeamPrediction {
    static belongsTo = [matchPrediction : MatchPrediction]
	String name
	int score

	String toString() { return name }
	
    static constraints = {
		score nullable: true
    }
}
