import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit"
export default class extends Controller {
  static targets = ["edited"]
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
    // const url = `http://localhost:3000/cards/${this.idValue}/redo`
    // const url = `${window.location.href}/redo`
    const url = `${window.location.origin}/cards/${this.idValue}/redo`
    console.log(url);
    fetch(url, { method: "POST", headers: { 'Accept': 'text/plain' } } )
    .then(response => response.text())
    .then((data) => {
      // console.log(data);
      this.editedTarget.innerHTML = data
    })
  }
}
