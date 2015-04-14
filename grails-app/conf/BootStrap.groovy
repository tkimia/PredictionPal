import predictionpal.*

class BootStrap {

    def init = { servletContext ->
		Team team1 = new Team(name:"Lions")
		Team team2 = new Team(name:"Tigers")
		Team team3 = new Team(name:"Bears")
		Team team4 = new Team(name:"Ruby Runners")
		Team team5 = new Team(name:"Witches")
		Team team6 = new Team(name:"Tin Men")
		Team team7 = new Team(name:"Tornadoes")
		Team team8 = new Team(name:"Lollipop Gang")

		Match match7 = new Match(posX:657, posY:-457,orderchar:'G')

		Match match5 = new Match(nextMatch: match7, posX:350, posY:-115,orderchar:'E')
		Match match6 = new Match(nextMatch: match7, posX:350, posY:-450,orderchar:'F')

		Match match1 = new Match(nextMatch:match5, posX:5, posY:0,orderchar:'A')
			.addToTeams(team1)
			.addToTeams(team2)
		Match match2 = new Match(nextMatch:match5, posX:20, posY:20,orderchar:'B')
			.addToTeams(team3)
			.addToTeams(team4)
		Match match3 = new Match(nextMatch:match6, posX:20, posY:20,orderchar:'C')
			.addToTeams(team5)
			.addToTeams(team6)
		Match match4 = new Match(nextMatch:match6, posX:20, posY:20,orderchar:'D')
			.addToTeams(team7)
			.addToTeams(team8)

		Tournament tourny = new Tournament(sid:"color", title:"Ruby Rumble", owner:"Oz", hasSeeds:false, hasScores:false, state: 1, acceptingPredictions:true, promotions:true)
			.addToMatches(match1)
			.addToMatches(match2)
			.addToMatches(match3)
			.addToMatches(match4)
			.addToMatches(match5)
			.addToMatches(match6)
			.addToMatches(match7)
			.save(flush:true, failOnError:true)

		/* one match tournament */
		Match rpsMatch = new Match()
			.addToTeams(new Team(name: "Julian"))
			.addToTeams(new Team(name: "Ricky"))
		Tournament rps = new Tournament(sid: "rps", title: "Rock Paper Scissors", owner: "Me", hasSeeds:false, hasScores:false, state: 3)
			.addToMatches(rpsMatch)
			.save(flush: true, failOnError: true)

		Prediction rpsPred = new Prediction(name: "Bobby", email:"flashexe3@yahoo.com.hk")
		TeamPrediction win = new TeamPrediction(name: "Ricky")
		MatchPrediction mPred = new MatchPrediction(correspondingMatch: rpsMatch, predictedWinner: win)
		rpsPred.addToMatchPredictions(mPred)
		rpsPred.save()
		rps.addToPredictions(rpsPred)
		rps.save(flush: true, failOnError: true)
    }

    def destroy = {
    }
}
