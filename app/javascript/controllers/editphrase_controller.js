import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["phedited", "spinner", "overlay"]
  static values = {
    id: String
   }
  connect() {
    console.log("connected");
    console.log(window.location.origin)
  }

  edit(event) {
    event.preventDefault();
    console.log(`here is the id: ${this.idValue}`)
    const url = `${window.location.origin}/cards/${this.idValue}/redophrase`
    console.log(url);
    this.showLoadingSpinner();
    fetch(url, { method: "POST", headers: { 'Accept': 'text/plain' } } )
    .then(response => response.text())
    .then((data) => {
      // console.log(data);
      this.hideLoadingSpinner();
      this.pheditedTarget.innerHTML = data
    })
  }

  showLoadingSpinner() {
    console.log("button clicked");
    this.spinnerTarget.innerHTML = "<div class='text-center'><div class='spinner-border border-xl text-info' style='width: 8rem; height: 8rem;' role='status'> <span class='sr-only'>Loading...</span></div></div>";
    this.overlayTarget.style.display = "block"; // show overlay
  }

  hideLoadingSpinner() {
    this.spinnerTarget.innerHTML = ""; // remove spinner HTML
    this.overlayTarget.style.display = "none"; // hide overlay
  }
}
