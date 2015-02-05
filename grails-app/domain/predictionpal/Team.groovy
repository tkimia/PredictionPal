package predictionpal

class Team {
	String name
	int score
	int seed
	static belongsTo = [match: Match]
	
    static constraints = {
    	
    }
}
