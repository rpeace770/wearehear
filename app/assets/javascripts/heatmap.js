var map;

  function initMap() {
    var place = {lat: 28.526, lng: -100.492};
    map = new google.maps.Map(document.getElementById("heatmap"), {
      center: place,
      zoom: 5
    });

  var image = "assets/lightbulb.png";
  var json_object = [{"lat": 25.087, "lng": -100.4596, "city": "Monterrey"}, {"lat": 28.526, "lng": -99.492, "city": "El Paso"}, {"lat": 46.004, "lng": -121.992, "city": "Seattle"}, {"lat": 27.907, "lng": -82.265, "city": "Miami"}, {"lat": 45.514, "lng": -68.554, "city": "Albany"}];
  var secretMessages = ["hi", "how", "are", "you", "now"];
    for(var i = 0; i < json_object.length; i++) {
      var latLng = new google.maps.LatLng(json_object[i].lat, json_object[i].lng);
      var marker = new google.maps.Marker({
        position: latLng,
        map: map,
        icon: image
      });
      attachSecretMessage(marker, secretMessages[i]);
    }
      function attachSecretMessage(marker, secretMessage) {
      var infowindow = new google.maps.InfoWindow({
        content: secretMessage
      });

      marker.addListener('click', function() {
        infowindow.open(marker.get('map'), marker);
      });
  }
}
