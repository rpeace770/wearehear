var map, infoWindow;
var markersArray = [];

function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 30.279, lng: -97.742},
    zoom: 15
  });
  // add message over pin???
    infoWindow = new google.maps.InfoWindow;

function clearOverlays() {
  for (var i = 0; i < markersArray.length; i++ ) {
    markersArray[i].setMap(null);
  }
  markersArray.length = 0;
}

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var geocoder = new google.maps.Geocoder();
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };

      infoWindow.setPosition(pos);
      var latLng = new google.maps.LatLng(pos.lat, pos.lng);
      var marker = new google.maps.Marker({
        position: latLng,
        map: map
      });
      document.getElementById("lat_coord").value = pos.lat;
      document.getElementById("lng_coord").value = pos.lng;
      markersArray.push(marker);
      // infoWindow.setContent('Set pin?');
      // infoWindow.open(map);
      map.setCenter(pos);

      geocoder.geocode({'latLng': latLng}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          var result;
          if (results.length > 1) {
            result = results[1];
          } else {
            result = results[0];
          }
        // document.getElementById("city").value = result.address_components[3].long_name;
        // document.getElementById("state").value = result.address_components[5].long_name;
        // document.getElementById("country").value = result.address_components[6].long_name;
        }
      });
    }, function() {
      handleLocationError(true, infoWindow, map.getCenter());
    });

  } else {
    // Browser doesn't support Geolocation
    handleLocationError(false, infoWindow, map.getCenter());
  }

  map.addListener('click', function(e) {
    clearOverlays();
    placeMarker(e.latLng);
    var latty = e.latLng.lat();
    var lnggy = e.latLng.lng();
    document.getElementById("lat_coord").value = latty;
    document.getElementById("lng_coord").value = lnggy;

    // $.ajax({
    //   url: "https://maps.googleapis.com/maps/api/geocode/json?latlng=" + latty + "," + lnggy + "&key=AIzaSyDme1iyB8SeVJPYRLUpYd-IPCEp8tIGGRY",
    //   success: function(response) {
    //     console.log(response);
    //     document.getElementById("city").value = response.results[0].address_components[3].long_name;
    //     document.getElementById("state").value = response.results[0].address_components[5].long_name;
    //     document.getElementById("country").value = response.results[0].address_components[6].long_name;
    //   }
    // });
  });

  function placeMarker(location) {
    var marker = new google.maps.Marker({
      position: location,
      map: map
    });
    markersArray.push(marker);
  }

// initHeatMap();
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(browserHasGeolocation ?
                        'Error: The Geolocation service failed.' :
                        'Error: Your browser doesn\'t support geolocation.');
  infoWindow.open(map);
}
