class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
		"/help"(view:"/helppage")
		"/portal"(view:"/portal")
		"500"(view:'/error')
        "/index_display"(view:"/tournament/index_display")
        "/tournament/create"(redirect:'/tournament/start')
	    "404"(view:'/404')
    }
}
