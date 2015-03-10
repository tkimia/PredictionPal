package predictionpal

class MatchPrediction {
    static belongsTo = [prediction : Prediction]
    Match correspondingMatch
    TeamPrediction predictedWinner
	
    static constraints = {

    }
}
