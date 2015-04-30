import predictionpal.*

class BootStrap {

    def init = { servletContext ->
		Team ateam1 = new Team(name:"Lions")
		Team ateam2 = new Team(name:"Tigers")
		Team ateam3 = new Team(name:"Bears")
		Team ateam4 = new Team(name:"Ruby Runners")
		Team ateam5 = new Team(name:"Witches")
		Team ateam6 = new Team(name:"Tin Men")
		Team ateam7 = new Team(name:"Tornadoes")
		Team ateam8 = new Team(name:"Lollipop Gang")

		Match match7 = new Match(posX:657, posY:-457,orderchar:'G')

		Match match5 = new Match(nextMatch: match7, posX:350, posY:-115,orderchar:'E')
		Match match6 = new Match(nextMatch: match7, posX:350, posY:-450,orderchar:'F')

		Match match1 = new Match(nextMatch:match5, posX:5, posY:0,orderchar:'A')
			.addToTeams(ateam1)
			.addToTeams(ateam2)
		Match match2 = new Match(nextMatch:match5, posX:20, posY:20,orderchar:'B')
			.addToTeams(ateam3)
			.addToTeams(ateam4)
		Match match3 = new Match(nextMatch:match6, posX:20, posY:20,orderchar:'C')
			.addToTeams(ateam5)
			.addToTeams(ateam6)
		Match match4 = new Match(nextMatch:match6, posX:20, posY:20,orderchar:'D')
			.addToTeams(ateam7)
			.addToTeams(ateam8)


		Tournament tourny = new Tournament(sid:"color", title:"Ruby Rumble", owner:"Oz", hasSeeds:false, hasScores:false, state: 1, acceptingPredictions:true, pass: "password", promotions:true)
			.addToMatches(match1)
			.addToMatches(match2)
			.addToMatches(match3)
			.addToMatches(match4)
			.addToMatches(match5)
			.addToMatches(match6)
			.addToMatches(match7)
			.save(flush:true, failOnError:true)

		/* one match tournament */
		WinTeam w = new WinTeam(name: "Julian", score: 0, seed: 0).save(flush:true, failOnError:true)
		Match rpsMatch = new Match(winner: w)
			.addToTeams(new Team(name: "Julian"))
			.addToTeams(new Team(name: "Ricky"))
		

		Tournament rps = new Tournament(sid: "rps", title: "Rock Paper Scissors", owner: "Me", hasSeeds:false, hasScores:false, state: 3, pass: "password")
			.addToMatches(rpsMatch)
			.save(flush: true, failOnError: true)

		Prediction rpsPred = new Prediction(name: "Bobby", email:"flashexe3@yahoo.com.hk")
		TeamPrediction win = new TeamPrediction(name: "Ricky")
		MatchPrediction mPred = new MatchPrediction(correspondingMatch: rpsMatch, predictedWinner: win)
		rpsPred.addToMatchPredictions(mPred)
		rpsPred.save()

		Prediction rpsPred2 = new Prediction(name: "Smitty")
		TeamPrediction win2 = new TeamPrediction(name: "Julian")
		rpsPred2.addToMatchPredictions(new MatchPrediction(correspondingMatch: rpsMatch, predictedWinner: win2))
		rpsPred2.save()

		rps.addToPredictions(rpsPred)
		rps.addToPredictions(rpsPred2)
		rps.save(flush: true, failOnError: true)



		Team team1 = new Team(name:"No Country for Old Men")
		Team team2 = new Team(name:"There Will Be Blood")
		Team team3 = new Team(name:"Juno")
		Team team4 = new Team(name:"Atonement")
		Team team5 = new Team(name:"Michael Clayton")

		Match bestPicture = new Match(orderChar:'A')
			.addToTeams(team1)
			.addToTeams(team2)
			.addToTeams(team3)
			.addToTeams(team4)
			.addToTeams(team5)


		Team team6 = new Team(name:"Joel and Ethan Coen")
		Team team7 = new Team(name:"Julian Schnable")
		Team team8 = new Team(name:"Jason Reitman")
		Team team9 = new Team(name:"Tony Gilroy")
		Team team10 = new Team(name:"Paul Thomas Anderson")
		Match bestDirector = new Match(orderChar:'B')
			.addToTeams(team6)
			.addToTeams(team7)
			.addToTeams(team8)
			.addToTeams(team9)
			.addToTeams(team10)

		Team team11 = new Team(name:"Daniel Day-Lewis")
		Team team12 = new Team(name:"George Clooney")
		Team team13 = new Team(name:"Johnny Depp")
		Team team14 = new Team(name:"Tommy Lee Jones")
		Team team15 = new Team(name:"Viggo Mortensen")
		Match bestActor = new Match(orderChar:'C')
			.addToTeams(team11)
			.addToTeams(team12)
			.addToTeams(team13)
			.addToTeams(team14)
			.addToTeams(team15)

		Team team16 = new Team(name:"Marion Cotillard")
		Team team17 = new Team(name:"Cate Blanchett")
		Team team18 = new Team(name:"Julie Christie")
		Team team19 = new Team(name:"Laura Linney")
		Team team20 = new Team(name:"Ellen Page")
		Match bestActress = new Match(orderChar:'D')
			.addToTeams(team16)
			.addToTeams(team17)
			.addToTeams(team18)
			.addToTeams(team19)
			.addToTeams(team20)

		Tournament tourn = new Tournament(sid:"oscars", title:"Academy Awards", owner:"Mr. Oscar", hasSeeds:false, hasScores:false, state: 1, acceptingPredictions:true, pass: "password", promotions:true)
			.addToMatches(bestPicture)
			.addToMatches(bestDirector)
			.addToMatches(bestActor)
			.addToMatches(bestActress)
			.save(flush:true, failOnError:true)

		TeamPrediction winner = new TeamPrediction(name: "No Country for Old Men")
		MatchPrediction amPred = new MatchPrediction(correspondingMatch: bestPicture, predictedWinner: winner)
		Prediction pred1 = new Prediction(name: "Bobby", email:"bobby@yopmail.com")
		pred1.addToMatchPredictions(amPred)
		pred1.save()
		tourn.addToPredictions(pred1)

    }

    def destroy = {
    }
}
