import { Application } from "@hotwired/stimulus";
import { Turbo } from "@hotwired/turbo-rails";

// Start Stimulus
const application = Application.start();

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

// Enable Turbo globally
Turbo.session.drive = true;

export { application, Turbo };
