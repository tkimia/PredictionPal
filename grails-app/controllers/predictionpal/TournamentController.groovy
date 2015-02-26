package predictionpal



class TournamentController {
    static scaffold = true

    def start() {

    }

    def packTournament() {
 		def newTourny = new Tournament(sid: generateSid(),
 			owner: params.owner, title: params.title,
 			state: 1, acceptingPredictions: true);

 		newTourny.hasSeeds = (params.hasSeeds) ? true : false;
 		newTourny.hasScores =  (params.hasScores) ? true : false;
        Match[] newMatches = new Match[params.numMatches];

        //this loop initializes all of the matches to be put into the
        //new tournament
 		for (int i = 0; i < params.int("numMatches"); i++) {
            char matchId = 65 + i
            int numTeams = params.int("match"+(char)matchId+"Teams");

            newMatches[i] = new Match()

            for(int j = 1; j <= numTeams; j++) {
                newMatches[i].addToTeams(new Team(name: params["match"+matchId+"Team"+j]))
            }
        }

        //this loop sets the nextMatch attribute on each of the
        //matches, then adds them to the tournament
        for(int i = 0; i < params.int("numMatches"); i++) {
            //get match next info
            char matchId = 65 + i
            def nextId = params["match"+(char)matchId+"Next"]

            //if match has next, assign it
            if (nextId) {
                int nextIndex = (nextId as char) - ('A' as char);
                log.error nextIndex;
                newMatches[i].nextMatch = newMatches[nextIndex]
            }

            newTourny.addToMatches(newMatches[i])
        }

        params.each() { key, value ->
            log.error key + ": " + value
        }

 		newTourny.save(flush: true, failOnError:true)
    	redirect(action: 'index')
    }

    def predict() {
    	def tournament = Tournament.findBySid(params.id);
    	if (!tournament)
    		response.sendError(404)
    	else
    		[tournament : tournament]
    }

    def packPredictions() {
        def t = Tournament.findByTitle(params.tournamentName)
        def newPrediction = new Prediction(tournament: t,
            name: params.name, email: params.email);


       MatchPrediction[] matches = new MatchPrediction[t.matches.size()];

       //TODO:Implement matchPrediction loop

       newPrediction.save(flush: true, failOnError:true)
       //redirect(action: 'index')
    }

    def generateSid() {
    	return UUID.randomUUID().toString().substring(0,8);
    }
}
