package predictionpal



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TournamentController {
    static scaffold = true


}
