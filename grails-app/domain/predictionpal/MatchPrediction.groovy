package predictionpal

class MatchPrediction {
    static belongsTo = [prediction : Prediction]
    static hasMany = [teams: Team]
    Match correspondingMatch
    Team predictedWinner

    static constraints = {

    }
}
