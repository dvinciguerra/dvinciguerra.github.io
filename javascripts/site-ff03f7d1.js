import { Application } from "@hotwired/stimulus"

import HomeController from "controllers/home_controller-25895d8b.js"

window.Stimulus = Application.start()
Stimulus.register("home", HomeController)
