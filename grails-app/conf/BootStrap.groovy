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




		Match bestPicture = new Match(posX:40, posY:66, orderchar:'A')
			.addToTeams(new Team(name:"No Country for Old Men"))
			.addToTeams(new Team(name:"There Will Be Blood"))
			.addToTeams(new Team(name:"Juno"))
			.addToTeams(new Team(name:"Michael Clayton"))
			.addToTeams(new Team(name:"Atonement"))


		Match bestDirector = new Match(posX:320, posY:-165, orderchar:'B')
			.addToTeams(new Team(name:"Joel and Ethan Coen"))
			.addToTeams(new Team(name:"Julian Schnable"))
			.addToTeams(new Team(name:"Jason Reitman"))
			.addToTeams(new Team(name:"Tony Gilroy"))
			.addToTeams(new Team(name:"Paul Thomas Anderson"))


		Match bestActor = new Match(posX:600, posY:-396, orderchar:'C')
			.addToTeams(new Team(name:"Daniel Day-Lewis"))
			.addToTeams(new Team(name:"George Clooney"))
			.addToTeams(new Team(name:"Johnny Depp"))
			.addToTeams(new Team(name:"Tommy Lee Jones"))
			.addToTeams(new Team(name:"Viggo Mortensen"))

		Match bestActress = new Match(posX:880, posY:-626, orderchar:'D')
			.addToTeams(new Team(name:"Marion Cotillard"))
			.addToTeams(new Team(name:"Cate Blanchett"))
			.addToTeams(new Team(name:"Julie Christie"))
			.addToTeams(new Team(name:"Laura Linney"))
			.addToTeams(new Team(name:"Ellen Page"))

		Tournament tourn = new Tournament(sid:"oscars", title:"Academy Awards", owner:"Mr. Oscar", hasSeeds:false, hasScores:false, state: 1, acceptingPredictions:true, pass: "password", promotions:true)
			.addToMatches(bestPicture)
			.addToMatches(bestDirector)
			.addToMatches(bestActor)
			.addToMatches(bestActress)
			.save(flush:true, failOnError:true)

		TeamPrediction winner = new TeamPrediction(name: "No Country for Old Men")
		MatchPrediction amPred = new MatchPrediction(correspondingMatch: bestPicture, predictedWinner: winner)
		
		TeamPrediction winner2 = new TeamPrediction(name: "Joel and Ethan Coen")
		MatchPrediction bmPred = new MatchPrediction(correspondingMatch: bestDirector, predictedWinner: winner2)

		TeamPrediction winner3 = new TeamPrediction(name: "Johnny Depp")
		MatchPrediction cmPred = new MatchPrediction(correspondingMatch: bestActor, predictedWinner: winner3)

		TeamPrediction winner4 = new TeamPrediction(name: "Ellen Page")
		MatchPrediction dmPred = new MatchPrediction(correspondingMatch: bestActress, predictedWinner: winner4)


		Prediction pred1 = new Prediction(name: "Bobby", email:"bobby@yopmail.com")
		pred1.addToMatchPredictions(amPred).addToMatchPredictions(bmPred).addToMatchPredictions(cmPred).addToMatchPredictions(dmPred)
		pred1.save()
		tourn.addToPredictions(pred1).save(flush: true, failOnError: true)

    }

    def destroy = {
    }
}
