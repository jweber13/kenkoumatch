// app/javascript/controllers/google_maps_controller.js
import { Controller } from "@hotwired/stimulus"
// Don't forget to import GMaps!
import GMaps from 'gmaps/gmaps.js';

// Connects to data-controller="google-maps"
export default class extends Controller {
  connect() {
    console.log(Number(this.element.dataset.lat));
    const lat = Number(this.element.dataset.lat);
    const lng = Number(this.element.dataset.lng);
    console.log(lat);
    console.log(lng);
    const latLng = new google.maps.LatLng(lat, lng)// (Number(this.element.dataset.lat), Number(this.element.dataset.lat));
    console.log(latLng);
    const map = new google.maps.Map(document.getElementById('map'), {
      center: latLng,
      zoom: 15
    });

    new google.maps.Marker({
      position: latLng,
      map: map
    });
    // const map = new GMaps({ el: '#map', lat: Number(this.element.dataset.lat), lng: Number(this.element.dataset.lat) });
    // const markers = JSON.parse(this.element.dataset.markers);
    // map.addMarkers(markers);
    // if (markers.length === 0) {
    //   map.setZoom(2);
    // } else if (markers.length === 1) {
    //   map.setCenter(markers[0].lat, markers[0].lng);
    //   map.setZoom(14);
    // } else {
    //   map.fitLatLngBounds(markers);
    // }
  }
}
