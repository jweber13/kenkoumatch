// Import the necessary modules
import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="google-search"
export default class extends Controller {
  static targets = ["input"];

  connect() {
    console.log('Google Search Controller connected');
  }

  findPlaceFromQuery(e) {
    e.preventDefault();
    const query = this.inputTarget.value
    const map = new google.maps.Map(document.getElementById('map'), {
      zoom: 15
    });
    const service = new google.maps.places.PlacesService(map);
    const request = {
      query,
      fields: ["name", "geometry", "formatted_address", "rating", "photos", "types", "place_id"]
    };
    service.findPlaceFromQuery(request, (results, status) => {
      if (status === google.maps.places.PlacesServiceStatus.OK) {
        console.log(results);

        const card = document.createElement('div');
        card.classList.add('card');

        const name = document.createElement('h3');
        name.textContent = results[0].name;
        card.appendChild(name);
        const address = document.createElement('p');
        address.textContent = results[0].formatted_address;
        card.appendChild(address);
        const rating = document.createElement('p');
        rating.textContent = `Rating: ${results[0].rating}`;
        card.appendChild(rating);
        const place_id = document.createElement('p');
        rating.textContent = `place_id: ${results[0].place_id}`;
        card.appendChild(place_id);
        const photo = document.createElement('img');
        const photoUrl = results[0].photos[0].getUrl({ maxWidth: 500, maxHeight: 333 });
        photo.src = photoUrl;
        card.appendChild(photo);
        // I am taking just the first type to now overwhelm with info
        const types = document.createElement('p');
        types.textContent = `Type: ${results[0].types[0]}`;
        card.appendChild(types);
        console.log(card);

        const cardContainer = document.getElementById('card-container');
        cardContainer.innerHTML = '';
        cardContainer.appendChild(card);
      }
    });
  }
}
