import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="savephrasebutton"
export default class extends Controller {
  connect() {
    console.log("save phrases button here");
  }

  savePhrases(event) {
    event.preventDefault();
    console.log("saving phrases");

    const alist = document.querySelectorAll(".addphrase");
    const checked = Array.from(alist).filter( el => el.innerHTML == "✓");
    const parentNodes = checked.map(el => el.parentNode.parentNode);

    const keyTexts = parentNodes.map(parentNode => {
      const keyElements = parentNode.querySelectorAll('.p1, .p2, .p3');
      const texts = Array.from(keyElements).map(keyElement => keyElement.textContent);
      return texts;
    });

    const jsonString = JSON.stringify(keyTexts);
    console.log(jsonString);
    const requestItems = {
      method: "POST",
      headers: {
        'Content-Type': 'application/json',
        'Accept': "application/json"
      },
      body: jsonString
    }

    const url = `${window.location.origin}/cards/${this.idValue}/studyphrases`;
    console.log(url)

    // console.log(parentNodes[0].querySelector(".p1"))

    fetch(url, requestItems)
      .then(response => response.json())
      .then(data => {
        console.log(data)
        if (data.status == "created") {
          // console.log(parentNodes[0])
          parentNodes.forEach(element => {
            if (data.message.includes(element.querySelector(".p1").textContent)) {
              element.querySelector(".card-show-phrase-top").classList.add("alt");
              element.querySelector(".addphrase").innerHTML = "o";
            }
          })
        }
        });
  }
}
