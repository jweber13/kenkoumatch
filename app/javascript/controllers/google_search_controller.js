// Import the necessary modules
import { Controller } from "@hotwired/stimulus"
import GMaps from 'gmaps/gmaps.js';
// Connects to data-controller="google-search"
export default class extends Controller {
  static targets = ["input", "cardInstitutionsIndexContainer", "result"];



  connect() {
    console.log('Google Search Controller connected');
    const map = new GMaps({ el: '#map', lat: 35.68, lng: 139.76 });
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

        const resultsInstitution = results.length;
        this.resultTarget.innerHTML = `${resultsInstitution} result(s) found`;
        // this.resultTarget.classList.add('text-primary');

        results.forEach(result => {
          console.log(result);

          // add a pin(or marker) to the map
          const marker = new google.maps.Marker({
            position: result.geometry.location,
            map: map
          });

          const ratingStars = '⭐'.repeat(Math.round(result.rating));
          const institutionsPath = `institutions/${result.place_id}`;
          const infoWindowContent = `<p><strong><a href=${institutionsPath}>${result.name}</a><strong></p>
            <p><strong>${result.rating} ${ratingStars}</strong></p>`

          const infoWindow = new google.maps.InfoWindow({
            position: result.geometry.location,
            content: infoWindowContent,
            pixelOffset: new google.maps.Size(0, -10)
          })

          // marker.addListener('click', () => {a
          //   infoWindow.open(map);
          // });

          marker.addListener("click", () => {
            infoWindow.open({
              anchor: marker,
              map,
            });
          });

          // create <div class='card-institutions-index'>
          // if you want to add style to the each card, use that class
          const cardInstitutionsIndex = document.createElement('div');
          cardInstitutionsIndex.classList.add('card-institutions-index');
          const photo = document.createElement('img');

          if (result.photos !== undefined) {
            const photoUrl = result.photos[0].getUrl(/*{ maxWidth: 500, maxHeight: 333 }*/);
            photo.src = photoUrl;
          } else {
            photo.src = 'https://www.shoshinsha-design.com/wp-content/uploads/2020/05/noimage-760x460.png'
          };

          cardInstitutionsIndex.appendChild(photo);

          const cardInstitutionsIndexInfos = document.createElement('div');
          cardInstitutionsIndexInfos.classList.add('card-institutions-index-infos')



          // create html elements and add text(result from the google maps api)
          const name = document.createElement('h2');
          const address = document.createElement('p');
          const rating = document.createElement('p');
          const showlink = document.createElement('a');
          showlink.classList.add('card-link');

          // Remove hyperlink appearance by modifying the style
          showlink.style.color = 'inherit'; // Set the link color to inherit the parent color
          showlink.style.textDecoration = 'none'; // Remove the underline

          name.textContent = result.name;
          address.textContent = result.vicinity
          rating.textContent = `${ratingStars} ${result.rating}`
          // const institutionsPath = `institutions/${result.place_id}`;
          showlink.href = institutionsPath;
          // showlink.textContent = 'view this hospital'

          // append created html elements into the card div(<div class='card-institutions-index'>)
          cardInstitutionsIndexInfos.appendChild(name);
          cardInstitutionsIndexInfos.appendChild(address);
          cardInstitutionsIndexInfos.appendChild(rating);
          cardInstitutionsIndexInfos.appendChild(showlink);
          cardInstitutionsIndex.appendChild(cardInstitutionsIndexInfos);
          cardInstitutionsIndex.appendChild(showlink);

          // append the card div(<div class='card-institutions-index'>) to the container
          container.appendChild(cardInstitutionsIndex);
        });
      }
    });
  };
}
