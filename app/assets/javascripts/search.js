$(document).ready(function(){
  $("#search_submit").on('submit', function(e){
    e.preventDefault();
    // $("#search-submit").hide();
    var formData = $(this).serialize();
    $.ajax({
      url: "/spotify_search",
      data: formData,
      method: "POST"
    }).done(function(response){
      $("#results").empty();
      $("#results").html(response);
    });
  });
  $("#results").on("submit", "form", function(e) {
    e.preventDefault();
    var children = $(this).children();
    $("#album").val(children[2].defaultValue);
    $("#artist").val(children[3].defaultValue);
    $("#spot_id").val(children[4].defaultValue);
    $("#song_title").val(children[5].defaultValue);

  });



});
