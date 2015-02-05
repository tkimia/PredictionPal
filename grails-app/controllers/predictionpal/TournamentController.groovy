package predictionpal



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TournamentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Tournament.list(params), model:[tournamentInstanceCount: Tournament.count()]
    }

    def show(Tournament tournamentInstance) {
        respond tournamentInstance
    }

    def create() {
        respond new Tournament(params)
    }

    @Transactional
    def save(Tournament tournamentInstance) {
        if (tournamentInstance == null) {
            notFound()
            return
        }

        if (tournamentInstance.hasErrors()) {
            respond tournamentInstance.errors, view:'create'
            return
        }

        /* updated code */
        //tournamentInstance.matches.clear()
        tournamentInstance.properties = params
        tournamentInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tournament.label', default: 'Tournament'), tournamentInstance.id])
                redirect tournamentInstance
            }
            '*' { respond tournamentInstance, [status: CREATED] }
        }
    }

    def edit(Tournament tournamentInstance) {
        respond tournamentInstance
    }

    @Transactional
    def update(Tournament tournamentInstance) {
        if (tournamentInstance == null) {
            notFound()
            return
        }

        if (tournamentInstance.hasErrors()) {
            respond tournamentInstance.errors, view:'edit'
            return
        }

        tournamentInstance.matches.clear()
        tournamentInstance.properties = params
        tournamentInstance.save flush:true



        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Tournament.label', default: 'Tournament'), tournamentInstance.id])
                redirect tournamentInstance
            }
            '*'{ respond tournamentInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Tournament tournamentInstance) {

        if (tournamentInstance == null) {
            notFound()
            return
        }

        tournamentInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Tournament.label', default: 'Tournament'), tournamentInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tournament.label', default: 'Tournament'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
