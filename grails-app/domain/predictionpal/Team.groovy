package predictionpal

class Team {
	String name
	int score
	int seed
	static belongsTo = [match: Match]

	String toString() { return name }
	
    static constraints = {
    }
}
