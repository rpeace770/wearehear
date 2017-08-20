var profilemap;

$(document).ready(function() {
  initProfileMap();
});

  function initProfileMap() {
    $.ajax({
      url: "/bouquets/locations",
      method: "post"
    })
    .done(function(response) {
    var place = {lat: 30.267, lng: -97.743};
    profilemap = new google.maps.Map(document.getElementById("profilemap"), {
      center: place,
      zoom: 4
    });

  var image = "assets/lightbulb.png";
  // var secretMessages = ["hi", "how", "are", "you", "now"];
    for(var i = 0; i < response.length; i++) {
      var latLng = new google.maps.LatLng(response[i].lat, response[i].lng);
      var marker = new google.maps.Marker({
        position: latLng,
        map: profilemap,
        icon: image
      });
      // attachSecretMessage(marker, secretMessages[i]);
    }
      function attachSecretMessage(marker, secretMessage) {
      var infowindow = new google.maps.InfoWindow({
        content: secretMessage
      });

      // marker.addListener('click', function() {
      //   infowindow.open(marker.get('profilemap'), marker);
      // });
      }
  });
}

