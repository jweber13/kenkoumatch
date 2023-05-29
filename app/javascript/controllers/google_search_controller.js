// Import the necessary modules
import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="google-search"
export default class extends Controller {
  static targets = ["input", "cardInstitutionsIndexContainer"];

  connect() {
    console.log('Google Search Controller connected');
    console.log(this.element.dataset.practice);
  }

  searchNearbyInstitutionsFromCurrentLocation(e) {
    e.preventDefault();
    console.log('clicked :)');
        navigator.geolocation.getCurrentPosition(
      (position) => {
          console.log(position.coords.latitude);
          console.log(position.coords.longitude);
          const lat = position.coords.latitude;
          const lng = position.coords.longitude;
          const latLng = new google.maps.LatLng(lat, lng);
          this.createInstitutionsIndex(latLng);
    });
  }

  searchNearbyInstitutionsFromAddress(e) {
    e.preventDefault();
    // console.log(this.element.dataset.practice);

    const userInput = this.inputTarget.value;

    const googleGeocoder = new google.maps.Geocoder;
    googleGeocoder.geocode({address: userInput, region: "jp"}, (result)=>{this.createInstitutionsIndex(result[0].geometry.location)});

    // navigator.geolocation.getCurrentPosition(
    //   (position) => {
    //       console.log(position.coords.latitude);
    //       console.log(position.coords.longitude);
    //       const lat = position.coords.latitude;
    //       const lng = position.coords.longitude;
    //       createInstitutionsIndex(lat, lng);
    // });

    // const createInstitutionsIndex = (latLng) => {
    //   const position = latLng
    //   const practice = this.element.dataset.practice //this.inputTarget.value
    //   const map = new google.maps.Map(document.getElementById('map'), {
    //     center: position,
    //     zoom: 15
    //   });
    //   const service = new google.maps.places.PlacesService(map);
    //   const request = {
    //     location: position,
    //     radius: '500',
    //     keyword: practice,
    //   };
    //   service.nearbySearch(request, (results, status) => {
    //     if (status === google.maps.places.PlacesServiceStatus.OK) {
    //       // console.log(results);
    //       results.forEach(result => {
    //         const container = this.cardInstitutionsIndexContainerTarget
    //         const cardInstitutionsIndex = document.createElement('div');
    //         cardInstitutionsIndex.classList.add('card-institutions-index');
    //         const name = document.createElement('h3');
    //         const address = document.createElement('p');
    //         const rating = document.createElement('p');
    //         const photo = document.createElement('img');
    //         console.log(result.photos);

    //         if (result.photos !== undefined) {
    //         const photoUrl = result.photos[0].getUrl({ maxWidth: 500, maxHeight: 333 });
    //         photo.src = photoUrl;
    //         };

    //         name.textContent = result.name;
    //         address.textContent = result.vicinity
    //         rating.textContent = result.rating
    //         cardInstitutionsIndex.appendChild(name);
    //         cardInstitutionsIndex.appendChild(address);
    //         cardInstitutionsIndex.appendChild(rating);
    //         cardInstitutionsIndex.appendChild(photo);
    //         container.appendChild(cardInstitutionsIndex);
    //       });
    //     }
    //   });
    // };
  }
  createInstitutionsIndex(latLng) {
    const container = this.cardInstitutionsIndexContainerTarget
    container.innerHTML = '';
    const position = latLng
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
        // console.log(results);
        results.forEach(result => {
          // const container = this.cardInstitutionsIndexContainerTarget
          const cardInstitutionsIndex = document.createElement('div');
          cardInstitutionsIndex.classList.add('card-institutions-index');
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
          cardInstitutionsIndex.appendChild(name);
          cardInstitutionsIndex.appendChild(address);
          cardInstitutionsIndex.appendChild(rating);
          cardInstitutionsIndex.appendChild(photo);
          container.appendChild(cardInstitutionsIndex);
        });
      }
    });
  };
}
