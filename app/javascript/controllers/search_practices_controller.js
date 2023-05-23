import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-practices"
export default class extends Controller {
  static targets = ["input", "form", "list"];

  // the connect gets run when it finds the data-controller in the HTML
  connect() {
    console.log("Connected!");
  }

  update() {
    // we need the query the user is searching for...
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`;
    fetch(url, { headers: { Accept: "text/plain" } })
      .then((response) => response.text())
      .then((data) => {
        // this.listTarget.insertAdjacentHTML("beforeend", data);
        this.listTarget.innerHTML = data;
        // we want to replace the list with the new partial (aka the 'data')
      });
  }
}
