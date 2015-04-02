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
		"/tournament/frontpage"(view:'/tournament/frontpage')
        "/tournament/create"(redirect:'/tournament/start')
	}
}
