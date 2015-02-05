package predictionpal



import grails.test.mixin.*
import spock.lang.*

@TestFor(TournamentController)
@Mock(Tournament)
class TournamentControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.tournamentInstanceList
            model.tournamentInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.tournamentInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def tournament = new Tournament()
            tournament.validate()
            controller.save(tournament)

        then:"The create view is rendered again with the correct model"
            model.tournamentInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            tournament = new Tournament(params)

            controller.save(tournament)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/tournament/show/1'
            controller.flash.message != null
            Tournament.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def tournament = new Tournament(params)
            controller.show(tournament)

        then:"A model is populated containing the domain instance"
            model.tournamentInstance == tournament
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def tournament = new Tournament(params)
            controller.edit(tournament)

        then:"A model is populated containing the domain instance"
            model.tournamentInstance == tournament
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/tournament/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def tournament = new Tournament()
            tournament.validate()
            controller.update(tournament)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.tournamentInstance == tournament

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            tournament = new Tournament(params).save(flush: true)
            controller.update(tournament)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/tournament/show/$tournament.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/tournament/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def tournament = new Tournament(params).save(flush: true)

        then:"It exists"
            Tournament.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(tournament)

        then:"The instance is deleted"
            Tournament.count() == 0
            response.redirectedUrl == '/tournament/index'
            flash.message != null
    }
}
