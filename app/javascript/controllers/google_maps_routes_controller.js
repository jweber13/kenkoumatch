import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="google-maps-routes"
export default class extends Controller {
  connect() {
    console.log("google-maps-routes-controller connected :)");
  }

  routes() {
    console.log("you're going to search the route :)")
    let startLatLng = [35.712408, 139.776188]; // 上野駅
    let targetLatLng = [35.710552, 139.777074]; // LIG
    let goalMarkerImg = 'https://82mou.github.io/src/images/marker-on-dummy.png';
    let map;

    const initialize = () => {
      let options = {
        zoom: 16,
        center: new google.maps.LatLng(startLatLng[0], startLatLng[1]),
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };
      map = new google.maps.Map(document.getElementById('map_canvas'), options);
      let rendererOptions = {
        map: map, // 描画先の地図
        draggable: true, // ドラッグ可
        preserveViewport: true // centerの座標、ズームレベルで表示
      };
      let directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);
      let directionsService = new google.maps.DirectionsService();
      directionsDisplay.setMap(map);
      let request = {
        origin: new google.maps.LatLng(startLatLng[0], startLatLng[1]), // スタート地点
        destination: new google.maps.LatLng(targetLatLng[0], targetLatLng[1]), // ゴール地点
        travelMode: google.maps.DirectionsTravelMode.WALKING, // 移動手段
      };
      directionsService.route(request, function(response,status) {
        if (status === google.maps.DirectionsStatus.OK) {
          new google.maps.DirectionsRenderer({
            map: map,
            directions: response,
            suppressMarkers: true // デフォルトのマーカーを削除
          });
          let leg = response.routes[0].legs[0];
          makeMarker(leg.end_location, markers.goalMarker, map);
          setTimeout(function() {
            map.setZoom(16); // ルート表示後にズーム率を変更
          });
        }
      });
    }

    function makeMarker(position, icon, map) {
      let marker = new google.maps.Marker({
        position: position,
        map: map,
        icon: icon
      });
    }

    let markers = {
      goalMarker: new google.maps.MarkerImage(
        goalMarkerImg, // 画像のパス
        new google.maps.Size(24, 33), // マーカーのwidth,height
        new google.maps.Point(0, 0), // 画像データの中で、どの部分を起点として表示させるか
        new google.maps.Point(12, 33), // マーカーのpositionで与えられる緯度経度を画像のどの点にするか
        new google.maps.Size(24, 33)) // 画像の大きさを拡大縮小
    };

    initialize();
  }
}
