$(document).ready(function() {
   $(".new-bouquet-section").on('click', "#upload_link", function(e){
        e.preventDefault();
         $("#upload").trigger('click');
    });

  $('.new-bouquet-section').on("change", '#upload', function(){
    $('#upload-msg').append('your image is uploaded!');
    $("#upload_link").hide();
  });

});

