import predictionpal.*

class BootStrap {

    def init = { servletContext ->
		Team team1 = new Team(name:"Lions")
		Team team2 = new Team(name:"Tigers")
		Team team3 = new Team(name:"Bears")
		Team team4 = new Team(name:"Dorthies")
		Team team5 = new Team(name:"Witches")
		Team team6 = new Team(name:"Tin Men")
		Team team7 = new Team(name:"Todos")
		Team team8 = new Team(name:"Ozilians")
		Team team9 = new Team(name:"Fairies")
		Team team10 = new Team(name:"Munchkins")
		Team team11 = new Team(name:"Lollipop Gang")
		Team team12 = new Team(name:"Monkeys")
		Team team13 = new Team(name:"Emereraldians")
		Team team14 = new Team(name:"Straw Men")
		Team team15 = new Team(name:"Ruby Runners")
		Team team16 = new Team(name:"Tornadoes")

		Match match15 = new Match()

		Match match13 = new Match(nextMatch: match15)
		Match match14 = new Match(nextMatch: match15)

		Match match9 = new Match(nextMatch: match13)
		Match match10 = new Match(nextMatch: match13)
		Match match11 = new Match(nextMatch: match14)
		Match match12 = new Match(nextMatch: match14)

		Match match1 = new Match(nextMatch:match9)
			.addToTeams(team1)
			.addToTeams(team2)
		Match match2 = new Match(nextMatch:match9)
			.addToTeams(team3)
			.addToTeams(team4)
		Match match3 = new Match(nextMatch:match10)
			.addToTeams(team5)
			.addToTeams(team6)
		Match match4 = new Match(nextMatch:match10)
			.addToTeams(team7)
			.addToTeams(team8)
		Match match5 = new Match(nextMatch:match11)
			.addToTeams(team9)
			.addToTeams(team10)
		Match match6 = new Match(nextMatch:match11)
			.addToTeams(team11)
			.addToTeams(team12)
		Match match7 = new Match(nextMatch:match12)
			.addToTeams(team13)
			.addToTeams(team14)
		Match match8 = new Match(nextMatch:match12)
			.addToTeams(team15)
			.addToTeams(team16)


		Tournament tourny = new Tournament(sid:"color", title:"Ruby Rumble", owner:"Mathilde", hasSeeds:false, hasScores:false, state: 1) 
			.addToMatches(match1)
			.addToMatches(match2)
			.addToMatches(match3)
			.addToMatches(match4)
			.addToMatches(match5)
			.addToMatches(match6)
			.addToMatches(match7)
			.addToMatches(match8)
			.addToMatches(match9)
			.addToMatches(match10)
			.addToMatches(match11)
			.addToMatches(match12)
			.addToMatches(match13)
			.addToMatches(match14)
			.addToMatches(match15)
			.save(flush:true, failOnError:true)
    }

    def destroy = {
    }
}
