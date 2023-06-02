import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="studyword-card"
export default class extends Controller {
  connect() {
    console.log('data-controller="studyword-card" connected :)');
  }

  static targets = ["japanese", "operatingHours"]

  revealJapanese() {
    console.log('clicked :)');
    const japanese = this.japaneseTarget
    if (japanese.classList.contains('d-none')) {
      this.japaneseTarget.classList.remove("d-none");
    } else {
      this.japaneseTarget.classList.add("d-none");
    }
  }

  hours() {
    console.log('clicked :)');
    const japanese = this.japaneseTarget
    if (japanese.classList.contains('d-none')) {
      this.japaneseTarget.classList.remove("d-none");
      this.operatingHoursTarget.innerHTML = "Operating Hours <i class='fa-solid fa-chevron-up'></i>"
    } else {
      this.japaneseTarget.classList.add("d-none");
      this.operatingHoursTarget.innerHTML = "Operating Hours <i class='fa-solid fa-chevron-down'></i>"
    }
  }
}
