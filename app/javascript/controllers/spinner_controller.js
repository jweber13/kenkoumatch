import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['spinner','overlay'];

  connect() {
    console.log("spinner controller connected");
  }

  showLoadingSpinner() {
    console.log("button clicked");
    this.spinnerTarget.innerHTML="<div class='text-center'><div class='spinner-border border-xl text-info'  style='width: 8rem; height: 8rem;' role='status'> <span class='sr-only'>Loading...</span></div></div>"
    this.overlayTarget.style.display = "block"; // show overlay
  }
}

// "<div class='spinner-border' role='status'> <span class='sr-only'>Loading...</span></div>"
