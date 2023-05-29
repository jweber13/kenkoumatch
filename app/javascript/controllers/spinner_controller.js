import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['spinner'];

  connect() {
    console.log("spinner controller connected");
  }

  showLoadingSpinner() {
    console.log("button clicked");
      this.spinnerTarget.innerHTML="<div class='spinner-border' role='status'> <span class='sr-only'>Loading...</span></div>"
  }
}
