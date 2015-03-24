package predictionpal

class User {
	static hasMany = [tournaments:Tournament, predictions:Prediction]
	String username
	String password
	
    static constraints = {
		password blank: false
		username unique: true, blank: false
    }
}
