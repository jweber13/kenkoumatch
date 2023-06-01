import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="studyword-card"
export default class extends Controller {
  connect() {
    console.log('data-controller="studyword-card" connected :)');
  }

  static targets = ["japanese"]

  revealJapanese() {
    console.log('clicked :)');
    const japanese = this.japaneseTarget
    if (japanese.classList.contains('d-none')) {
      this.japaneseTarget.classList.remove("d-none");
    } else {
      this.japaneseTarget.classList.add("d-none");
    }
  }
}
