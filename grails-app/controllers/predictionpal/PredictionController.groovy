package predictionpal

class PredictionController {
	static scaffold=true;
	def index() { }
	
	def delPred(){
		def ids = params.list('id');
		def sids = params.list('tou');
		def toBe = Prediction.findById(ids.first());
		toBe.delete(flush:true);
		redirect(controller: 'Tournament', action:'predictions', params:[id:sids.first()]);
	}
	
}
