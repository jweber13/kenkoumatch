import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="addwordbutton"
export default class extends Controller {
  static targets = ["button"];

  connect() {
    console.log("addword here");
  }

  toggleSave() {
    if (this.buttonTarget.innerHTML == "+") {
      this.buttonTarget.innerHTML = "✓";
    } else {
      this.buttonTarget.innerHTML = "+";
    }
  }
}
