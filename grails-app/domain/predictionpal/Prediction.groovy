package predictionpal

class Prediction {
	static belongsTo = [tournament:Tournament]
	static hasMany = [matchPredictions:MatchPrediction]
	String name
	String email
	int predPoints //to be implemented

    static constraints = {
    	email email: true, blank: true
    	predPoints nullable: true
    }
}
