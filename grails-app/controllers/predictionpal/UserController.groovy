package predictionpal

class UserController {
	static scaffold = true
	
    def index() { }
	
	def login() {
		def name = params.user_name
		def pass = params.pass_word
		def user1 = User.findByUsername(name)
		if(!user1){
			response.deleteCookie('username')
			response.setCookie('username','error', 10)
		}else{
			if(pass == user1.password){
				response.deleteCookie('username')
				response.setCookie('username', name, -1)
				redirect(uri:"/")
				return;
			}else{
				response.deleteCookie('username')
				response.setCookie('error', name, 10)
			}
		}
		redirect(uri: "/home", params:[logged_in:'error'])
	}
	
	def register(){
		def name = params.user_name
		def pass1 = params.pass_word1
		def pass2 = params.pass_word2
		if(pass1 == '' || pass1.length() < 6 || pass1.length() > 30){
			redirect(uri:"/register",params:[s:'1'])
			return;
		}else if(pass1 != pass2){
			redirect(uri:"/register", params:[s:'2'])
			return
		}else if(name.length()<4||name.length()>20){
			redirect(uri:"/register", params:[s:'4'])
			return
		}
		def user = User.findByUsername(name);
		if(user || name == '' || name == 'error' || name=='null'){
			redirect(uri:"/register", params:[s:'3'])
			return
		}else{
			def u = new User(username: name, password: pass1)
			u.save(flush:true, failonError: true)
			response.setCookie('username', name, -1)
			redirect(uri:'/')
		}
	}
	
	def profile(){
		def name = request.getCookie('username')
		def user = User.findByUsername(name);
		if(!user){
			redirect(uri:'/')
			return;
		}
		[user : user ]
	}
	
	def logout(){
		response.deleteCookie('username')
		redirect(uri:'/')
	}
}
