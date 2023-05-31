import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="addphrasebutton"
export default class extends Controller {
  static targets = ["button"];
  connect() {
    console.log("add phrase is here");
  }

  toggleSave() {
    if (this.buttonTarget.innerHTML == "+") {
      this.buttonTarget.innerHTML = "✓";
    } else if (this.buttonTarget.innerHTML == "✓") {
      this.buttonTarget.innerHTML = "+";
    }
  }
}
