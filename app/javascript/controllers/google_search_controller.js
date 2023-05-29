// Import the necessary modules
import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="google-search"
export default class extends Controller {
  static targets = ["input", "cardInstitutionsIndexContainer"];

  connect() {
    console.log('Google Search Controller connected');
  }

  searchNearbyInstitutionsFromCurrentLocation(e) {
    e.preventDefault();
    console.log('clicked :)');
    // get current user location and call create #reateInstitutionsIndex
    navigator.geolocation.getCurrentPosition(
      (position) => {
          console.log(position.coords.latitude);
          console.log(position.coords.longitude);
          const lat = position.coords.latitude;
          const lng = position.coords.longitude;
          // instantiate google latLng instance with coordinates of the user current location
          const latLng = new google.maps.LatLng(lat, lng);
          this.createInstitutionsIndex(latLng);
    });
  }

  searchNearbyInstitutionsFromAddress(e) {
    e.preventDefault();
    // getting user input about location
    const userInput = this.inputTarget.value;
    // initiate googleGeocoder constructor
    const googleGeocoder = new google.maps.Geocoder;
    // convert the input into the coordinates and call #createInstitutionsIndex
    googleGeocoder.geocode({address: userInput, region: "jp"}, (result)=>{this.createInstitutionsIndex(result[0].geometry.location)});
  }

  createInstitutionsIndex(latLng) {
    // container: <div id="card-institutions-index-container...>"(see also app/views/institutions/index.html.rb: class=cardInstitutionsIndexContainerTarget)
    const container = this.cardInstitutionsIndexContainerTarget
    // clear the container
    container.innerHTML = '';
    const position = latLng;
    const practice = this.element.dataset.practice;
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

        results.forEach(result => {
          // create <div class='card-institutions-index'>
          // if you want to add style to the each card, use that class
          const cardInstitutionsIndex = document.createElement('div');
          cardInstitutionsIndex.classList.add('card-institutions-index');

          // create html elements and add text(result from the google maps api)
          const name = document.createElement('h3');
          const address = document.createElement('p');
          const rating = document.createElement('p');
          const photo = document.createElement('img');
          console.log(result.photos);

          if (result.photos !== undefined) {
          const photoUrl = result.photos[0].getUrl({ maxWidth: 500, maxHeight: 333 });
          photo.src = photoUrl;
          };

          name.textContent = result.name;
          address.textContent = result.vicinity
          rating.textContent = result.rating

          // append created html elements into the card div(<div class='card-institutions-index'>)
          cardInstitutionsIndex.appendChild(name);
          cardInstitutionsIndex.appendChild(address);
          cardInstitutionsIndex.appendChild(rating);
          cardInstitutionsIndex.appendChild(photo);

          // append the card div(<div class='card-institutions-index'>) to the container
          container.appendChild(cardInstitutionsIndex);
        });
      }
    });
  };
}
