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

            if(newTourny.hasSeeds == true){
                for(int j = 1; j <= numTeams; j++) {
                    if (params["match"+matchId+"Team"+j]){
                        newMatches[i].addToTeams(new Team(name: params["match"+matchId+"Team"+j], seed: params["match"+matchId+"Team"+j+"seed"]))
                    }
                }
            }else {
                for(int j = 1; j <= numTeams; j++) {
                    if (params["match"+matchId+"Team"+j]){
                        newMatches[i].addToTeams(new Team(name: params["match"+matchId+"Team"+j]))
                    }
                }
            }
            newMatches[i].orderchar = (char)matchId;
            if (params["match"+(char)matchId+"PosX"] && params["match"+(char)matchId+"PosY"]) {
                newMatches[i].posX = (int)params.double("match"+(char)matchId+"PosX")
                newMatches[i].posY = (int)params.double("match"+(char)matchId+"PosY")
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
        newTourny.save(flush: true, failOnError:true)

        params.each() { key, value ->
            log.error key + ": " + value
        }


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
        if (t.state != 1){
            //The prediction is no longer accepting predictions, show an error to the user
            return;
        }

        def newPrediction = new Prediction(tournament: t,
            name: params.name, email: params.email);

        for (Match m: t.matches){

            def matchWinner = params[m.id.toString()]

            TeamPrediction tp = new TeamPrediction(name: matchWinner)
            MatchPrediction mp = new MatchPrediction(correspondingMatch: m, predictedWinner: tp)
            newPrediction.addToMatchPredictions(mp)

        }
        t.addToPredictions(newPrediction);


        t.save(flush: true, failOnError:true)
        redirect(action: 'index')
    }

	def update() {
		def tournament = Tournament.findBySid(params.id);
		if (!tournament)
			response.sendError(404)
		else
			[tournament : tournament]
	}

    def viewPrediction() {
        def prediction = Prediction.findById(params.id);
        if (!prediction)
            response.sendError(404)
        else
            [prediction : prediction]
    }

	def updateTournament() {
		def t = Tournament.findByTitle(params.tournamentName)

		for (Match m: t.matches){
			def matchWinner = params[m.id.toString()]
			if(matchWinner==null){
			}else{
				WinTeam tp = new WinTeam(name: matchWinner)
				tp.save();
				m.setWinner(tp)

                //Since the owner has submitted the first winner, stop accepting predictions
                if (t.state == 1){
                    t.state = 2
                }

				if(m.nextMatch!=null){
					Team part = new Team(name:matchWinner)
					m.nextMatch.addToTeams(part)
				}
			}
		}
		for(Prediction p: t.predictions){
			int score = 0;
			for(MatchPrediction m: p.matchPredictions){
				if(m.predictedWinner.name==m.correspondingMatch.winner.name){
					score++
				}
			}
			p.predPoints = score
		}
		for(Match m: t.matches){ //Look at all matches for completion.
			if(m.getWinner()==null){ //If any match has not completed
				t.save(flush: true, failOnError:true)
				redirect(action: 'index')
				return;
			}
		}
		//If every match has a winner
		t.state = 3;
		emailParticipants(t);
		t.save(flush: true, failOnError:true)
		redirect(action: 'index')
	}

	def predictions(){
		def tournament = Tournament.findBySid(params.id);
		if(!tournament)
			response.sendError(404)
		else
			[tournament : tournament]
	}

	def stopAcceptingPredicts() {
		def tournament = Tournament.findBySid(params.id);
		if (!tournament) {
			redirect(action: 'index')
		}
		else {
            //Stop accepting predictions with state 2
			tournament.state = 2
			tournament.acceptingPredictions = false
			tournament.save(flush: true)
			redirect(uri: '/tournament/show/'+tournament.id )
		}

	}

    def generateSid() {
    	return UUID.randomUUID().toString().substring(0,8);
    }
    def mailService

    def emailParticipants(Tournament t) {
        def emailSubject = "Tournament ${t.title} complete"

        for (Prediction p : t.predictions){
            if (p.email != null){

                mailService.sendMail{
                    async true
                    to p.email
                    from "predictionpal@gmail.com"
                    subject emailSubject
                    html g.render(template:'/tournament/mail', model:[p: p, t: t])
                }
            }
        }
    }

	def results() {
		def tournament = Tournament.findBySid(params.id);
		if (!tournament)
			response.sendError(404)
		else
			[tournament : tournament]
	}

    def tournamentResults() {
        def tournament = Tournament.findBySid(params.id);
        if (!tournament)
            response.sendError(404)
        else
            [tournament : tournament]
    }

    def personalResult(){
        def prediction = Prediction.findById(params.id);
        if (!prediction)
            response.sendError(404)
        else
            [prediction : prediction]
    }
	def portal(){
		def code = params.code
		def tournament = Tournament.findBySid(code);
		if(!tournament)
			redirect(uri: '/portal' )
		else{
			if(tournament.state==1){ //accepting predictions
				redirect(action: 'predict', params:[id:code])
			}else if(tournament.state==2){ //started
				redirect(action: 'results', params:[id:code])
			}else if(tournament.state==3){ //finished
				redirect(action: 'results', params:[id:code])
			}
		}
	}
}
