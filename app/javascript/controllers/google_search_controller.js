// Import the necessary modules
import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="google-search"
export default class extends Controller {
  static targets = ["input", "cardInstitutionsIndexContainer"];

  connect() {
    console.log('Google Search Controller connected');
    console.log(this.element.dataset.practice);
  }

  searchNearbyInstitutions(e) {
    e.preventDefault();
    console.log(this.element.dataset.practice);
    // position should be replaced by (user input -> coordinates), using google map api(geocoding)
    const position = new google.maps.LatLng(35.729756, 139.711069)
    const practice = this.element.dataset.practice //this.inputTarget.value
    const map = new google.maps.Map(document.getElementById('map'), {
      center: position,
      zoom: 15
    });
    const service = new google.maps.places.PlacesService(map);
    const request = {
      location: position,
      radius: '500',
      keyword: practice,
    };
    service.nearbySearch(request, (results, status) => {
      if (status === google.maps.places.PlacesServiceStatus.OK) {
        console.log(results);
        results.forEach(result => {
          const container = this.cardInstitutionsIndexContainerTarget
          const cardInstitutionsIndex = document.createElement('div');
          cardInstitutionsIndex.classList.add('card-institutions-index');
          const name = document.createElement('h3');
          const address = document.createElement('p');
          const rating = document.createElement('p');
          const photo = document.createElement('img');
          const photoUrl = result.photos[0].getUrl({ maxWidth: 500, maxHeight: 333 });
          name.textContent = result.name;
          address.textContent = result.vicinity
          rating.textContent = result.rating
          photo.src = photoUrl;
          cardInstitutionsIndex.appendChild(name);
          cardInstitutionsIndex.appendChild(address);
          cardInstitutionsIndex.appendChild(rating);
          cardInstitutionsIndex.appendChild(photo);
          container.appendChild(cardInstitutionsIndex);
        });
      }
    });
  }
}
