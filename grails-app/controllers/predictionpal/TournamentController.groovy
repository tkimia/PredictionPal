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


 		//TODO: implement numMatches loop (HAS TO HAVE HASHMAP INSTEAD)
        Match[] newMatches = new Match[params.numMatches];
 		for (int i = 0; i < params["numMatches"]; i++) {
            char matchId = 65 + i
            int numTeams = params["match"+(char)matchId+"Teams"]
            newMatches[i] = new Match()

            for(int j = 1; j <= numTeams; j++) {
                newMatches[i].addToTeams(new Team(name: params["match"+matchId+"Team"+j]))
            }
        }

        for(int i = 0; i < params.numMatches; i++)
            newTourny.addToMatches(newMatches[i])

 		newTourny.save(flush: true, failOnError:true)
 		flash.message = params["numMatches"]
    	redirect(action: 'index')
    }

    def predict() {
    	def tournament = Tournament.findBySid(params.id);
    	if (!tournament)
    		response.sendError(404)
    	else
    		[tournament : tournament]
    }


    def generateSid() {
    	return UUID.randomUUID().toString().substring(0,8);
    }
}
