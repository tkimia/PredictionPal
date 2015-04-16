package predictionpal

import java.util.UUID

class Tournament {
	String sid  //id for URL
	static hasMany = [matches:Match, predictions:Prediction]
	int state // 1 - open, 2 - running, 3 - finished
	String title
	String owner
	boolean hasSeeds  //whether or not there are seeds in the tournament
	boolean hasScores  //whether or not users enter scores in predictions
	boolean acceptingPredictions //at some point stop accepting predictions
	String pass

	boolean promotions //whether or not it will be promoted on the frontpage

    static constraints = {
    	title blank: false
    	owner blank: false
    	sid unique: true, blank: false
    	matches cascade:"all-delete-orphan"
    	pass blank: false
    }


}
