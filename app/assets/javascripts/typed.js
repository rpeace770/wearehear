$(document).ready(function() {
  $(".choose-link").on("click",function(e){
    var text = $("#locale").val();
    var comment = $("#comment").val();
    var person = $("#person").val();
    if($("#location_confirm").text().length === 0){
      $("#location_confirm" ).append(text);
    }
    if($("#comment_confirm").text().length === 0){
      $("#comment_confirm" ).append(comment);
  }
   if ($("#person_confirm").text().length === 0){
     $("#person_confirm").append(person);

   }
  });
});



