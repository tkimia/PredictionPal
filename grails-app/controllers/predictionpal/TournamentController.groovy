package predictionpal

class TournamentController {
    static scaffold = true

    def start() {

    }

    def packTournament() {
    	params.name.each{i->
            System.out.println(i);
		}
    	//redirect(action: 'index')
    }

}
