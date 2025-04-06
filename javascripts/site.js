import { Application } from "@hotwired/stimulus"

import HomeController from "./controllers/home_controller.js"

window.Stimulus = Application.start()
Stimulus.register("home", HomeController)
