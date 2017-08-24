$(document).ready(function() {
  $(".choose-link").on("click", function(e) {
    e.preventDefault();

    $(".choose-link").show();
    $(this).hide();
    $(".new-bouquet-section").hide();
    $("#map").hide();
    $("#pac-input").hide();
    $(this).parent().next().show();

    if($("#lat_coord").val() === "" && $(this).parent().next().hasClass("map-class")) {
      $('.songs_results').hide();
      $("#map").show();
      $("#pac-input").show();
      initMap();
    } else if($("#lat_coord").val() != "" && $(this).parent().next().hasClass("map-class")) {
      $('.songs_results').hide();
      $("#map").show();
      $("#pac-input").show();
    } else if($(this).parent().next().hasClass("song-show")) {
      $('.songs_results').show();
    }
  });
});
