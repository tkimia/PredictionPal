package predictionpal

class Prediction {
	static belongsTo = [tournament:Tournament]
	static hasMany = [matchPredictions:MatchPrediction]
	String name
	String email
	int predPoints //to be implemented

	String toString() { return name }
	
    static constraints = {
    	email email: true, blank: true, nullable:true
    	predPoints nullable: true
    }
}
