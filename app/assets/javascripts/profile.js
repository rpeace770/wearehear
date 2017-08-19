// var map;

//   function initMap() {
//     var place = {lat: 28.526, lng: -100.492};
//     map = new google.maps.Map(document.getElementById("map"), {
//       center: place,
//       zoom: 5
//     });

//   var image = "assets/lightbulb.png";
//   var json_object = [{"lat": 25.087, "lng": -100.4596, "city": "Monterrey"}, {"lat": 28.526, "lng": -99.492, "city": "El Paso"}, {"lat": 46.004, "lng": -121.992, "city": "Seattle"}, {"lat": 27.907, "lng": -82.265, "city": "Miami"}, {"lat": 45.514, "lng": -68.554, "city": "Albany"}];
//   var secretMessages = ["hi", "how", "are", "you", "now"];
//     for(var i = 0; i < json_object.length; i++) {
//       var latLng = new google.maps.LatLng(json_object[i].lat, json_object[i].lng);
//       var marker = new google.maps.Marker({
//         position: latLng,
//         map: map,
//         icon: image
//       });
//       attachSecretMessage(marker, secretMessages[i]);
//     }
//       function attachSecretMessage(marker, secretMessage) {
//       var infowindow = new google.maps.InfoWindow({
//         content: secretMessage
//       });

//       marker.addListener('click', function() {
//         infowindow.open(marker.get('map'), marker);
//       });
//   }


//   map.addListener('click', function(e) {
//     placeMarker(e.latLng);
//   });

//   function placeMarker(location) {
//     var marker = new google.maps.Marker({
//       position: location,
//       map: map
//     });
//   }

// }







// SCROLL DOWN FOR SEARCH MAP












// STARTING AUTOCOMPLETE
  // var card = document.getElementById('pac-card');
  // var input = document.getElementById('pac-input');
  // var types = document.getElementById('type-selector');
  // var strictBounds = document.getElementById('strict-bounds-selector');

  // map.controls[google.maps.ControlPosition.TOP_RIGHT].push(card);

  // var autocomplete = new google.maps.places.Autocomplete(input);
  // autocomplete.bindTo('bounds', map);
// ENDING AUTOCOMPLETE

  // infoWindow = new google.maps.InfoWindow;

//STARTING AUTOCOMPLETE
  // var infowindowContent = document.getElementById('infowindow-content');
  // infowindow.setContent(infowindowContent);

  // autocomplete.addListener('place_changed', function() {
  //         infowindow.close();
  //         marker.setVisible(false);
  //         var place = autocomplete.getPlace();
  //         if (!place.geometry) {
  //           // User entered the name of a Place that was not suggested and
  //           // pressed the Enter key, or the Place Details request failed.
  //           window.alert("No details available for input: '" + place.name + "'");
  //           return;
  //         }

          // If the place has a geometry, then present it on a map.
        //   if (place.geometry.viewport) {
        //     map.fitBounds(place.geometry.viewport);
        //   } else {
        //     map.setCenter(place.geometry.location);
        //     map.setZoom(17);  // Why 17? Because it looks good.
        //   }
        //   marker.setPosition(place.geometry.location);
        //   marker.setVisible(true);

        //   var address = '';
        //   if (place.address_components) {
        //     address = [
        //       (place.address_components[0] && place.address_components[0].short_name || ''),
        //       (place.address_components[1] && place.address_components[1].short_name || ''),
        //       (place.address_components[2] && place.address_components[2].short_name || '')
        //     ].join(' ');
        //   }

        //   infowindowContent.children['place-icon'].src = place.icon;
        //   infowindowContent.children['place-name'].textContent = place.name;
        //   infowindowContent.children['place-address'].textContent = address;
        //   infowindow.open(map, marker);
        // });

        // Sets a listener on a radio button to change the filter type on Places
        // Autocomplete.
        // function setupClickListener(id, types) {
        //   var radioButton = document.getElementById(id);
        //   radioButton.addEventListener('click', function() {
        //     autocomplete.setTypes(types);
        //   });
        // }

        // setupClickListener('changetype-all', []);
        // setupClickListener('changetype-address', ['address']);
        // setupClickListener('changetype-establishment', ['establishment']);
        // setupClickListener('changetype-geocode', ['geocode']);

        // document.getElementById('use-strict-bounds')
        //     .addEventListener('click', function() {
        //       console.log('Checkbox clicked! New state=' + this.checked);
        //       autocomplete.setOptions({strictBounds: this.checked});
        //     });
// ENDING AUTOCOMPLETE
