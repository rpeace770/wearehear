var mapbase, heatmap;

function initHeatMap() {
     mapbase = new google.maps.Map(document.getElementById('mapbase'), {
          zoom: 4,
          center: {lat: 40.267, lng: -97.743}
     });
          var get_it = getPoints();
          var here = get_it.done(function(response) {
               var array = [];
               response.forEach(function(location) {
                    array.push(new google.maps.LatLng(location.lat, location.lng));
               });
               heatmap = new google.maps.visualization.HeatmapLayer({
                    data: array,
                    map: mapbase
                });
          });
}

function toggleHeatmap() {
     heatmap.setMap(heatmap.getMap() ? null : mapbase);
}

function changeGradient() {
     var gradient = [
     'rgba(0, 255, 255, 0)',
     'rgba(0, 255, 255, 1)',
     'rgba(0, 191, 255, 1)',
     'rgba(0, 127, 255, 1)',
     'rgba(0, 63, 255, 1)',
     'rgba(0, 0, 255, 1)',
     'rgba(0, 0, 223, 1)',
     'rgba(0, 0, 191, 1)',
     'rgba(0, 0, 159, 1)',
     'rgba(0, 0, 127, 1)',
     'rgba(63, 0, 91, 1)',
     'rgba(127, 0, 63, 1)',
     'rgba(191, 0, 31, 1)',
     'rgba(255, 0, 0, 1)'
     ];
     heatmap.set('gradient', heatmap.get('gradient') ? null : gradient);
}

function changeRadius() {
     heatmap.set('radius', heatmap.get('radius') ? null : 20);
}

function changeOpacity() {
     heatmap.set('opacity', heatmap.get('opacity') ? null : 0.2);
}

// Heatmap data: 500 Points
function getPoints() {
     var search = $.ajax({
          url: 'bouquets/all',
          method: "post"
     });
     return search;
}
