class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller:"index")
		"/home"(view:"/index"){
            controller = "tournament"
            action = "index_display"
        }
		"/help"(view:"/helppage")
		"/portal"(view:"/portal")
		"/register"(view:"/register")
		"/logout"(controller:"user", action:"logout")
		"500"(view:'/error')
        "/updatePromotion"(view:"/tournament/updatePromotion")
        "/index_display"(view:"/tournament/index_display")
        "/tournament/create"(redirect:'/tournament/start')
	    "404"(view:'/404')
    }
}
