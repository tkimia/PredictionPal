class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
		"/help"(view:"/helppage")
        "500"(view:'/error')
		"/tournament/frontpage"(view:'/tournament/frontpage')
        "/tournament/create"(redirect:'/tournament/start')
	}
}
