import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="savewordbutton"
export default class extends Controller {
  static targets = ["kna", "knj", "eng"];

  connect() {
    console.log("save button here")
  }

  saveWords(event) {
    event.preventDefault();
    const alist = document.querySelectorAll(".addword");
    const checked = Array.from(alist).filter( el => el.innerHTML == "✓");
    const parentNodes = checked.map(el => el.parentNode);

    const keyTexts = parentNodes.map(parentNode => {
      const keyElements = parentNode.querySelectorAll('.key1, .key2, .key3');
      const texts = Array.from(keyElements).map(keyElement => keyElement.textContent);
      return texts;
    });

    const jsonString = JSON.stringify(keyTexts);
    console.log(jsonString);
    const  requestItems = {
      method: "POST",
      headers: {
        'Content-Type': 'application/json',
        'Accept': "application/json"
      },
      body: jsonString
    }

    const url = `${window.location.origin}/cards/${this.idValue}/studywords`;

    fetch(url, requestItems)
      .then(response => response.json())
      .then(data => {
        console.log(data)
        if (data.status == "created") {
          // console.log(parentNodes[0])
          parentNodes.forEach(element => {
            if (data.message.includes(element.querySelector(".key3").textContent)) {
              element.classList.add("alt");
              element.querySelector(".addword").innerHTML = "o";
            }
          });
        }
      });

  }
}
