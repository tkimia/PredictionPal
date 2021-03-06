package predictionpal

class User {
	static hasMany = [tournaments:Tournament, predictions:Prediction]
	String username
	String emails
	String password
	
    static constraints = {
		password blank: false
		username blank: false
		emails email:true
		emails nullable: true
		tournaments nullable: true
		predictions nullable: true
    }
}
