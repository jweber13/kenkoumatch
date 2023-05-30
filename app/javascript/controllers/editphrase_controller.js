import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["phedited"]
  static values = {
    id: String
   }
  connect() {
    console.log("connected");
    console.log(window.location.origin)
  }

  edit(event) {
    console.log("here")
    event.preventDefault();
    console.log(`here is the id: ${this.idValue}`)
    const url = `${window.location.origin}/cards/${this.idValue}/redophrase`
    console.log(url);
    fetch(url, { method: "POST", headers: { 'Accept': 'text/plain' } } )
    .then(response => response.text())
    .then((data) => {
      // console.log(data);
      this.pheditedTarget.innerHTML = data
    })
  }
}
