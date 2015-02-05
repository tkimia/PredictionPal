package predictionpal

class Tournament {
	String id  //id for URL
	List<Match> matches = [] //.withLazyDefault{ new Match() }
	static hasMany = [matches:Match, predictions:Prediction]
	int state // 1 - open, 2 - running, 3 - finished
	String title 
	String owner
	boolean hasSeeds  //whether or not there are seeds in the tournament
	boolean hasScores  //whether or not users enter scores in predictions

    static constraints = {
    	title blank: false
    	owner blank: false
    	id unique: true, blank: false
    	matches cascade:"all-delete-orphan"
    }

    String toString() {
    	return title + " by " + owner
    }
}
