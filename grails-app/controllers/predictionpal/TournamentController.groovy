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

 		//TODO: implement numMatches loop
 		

 		newTourny.save(flush: true, failOnError:true);
 		flash.message = "New torunament created"
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
