package predictionpal

class IndexController {

    def index() {
		def uname = request.getCookie('username');
		User user = User.findByUsername(uname);
		if(!user){
			uname = 'null';
		}
		redirect(uri:'/home', params:[logged_in:uname]);
	}

	def index_display() {
		def tournaments = Tournament.list()
    	[tournaments:tournaments]
	}
}
