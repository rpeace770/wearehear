$(document).ready(function() {
   $("#new-bouquet-form").on('click', "#upload_link", function(e){
        e.preventDefault();
         $("#upload").trigger('click');
    });

  $('#new-bouquet-form').on("change", '#upload', function(){
    $('#upload-msg').append('your image is uploaded!');
    $("#upload_link").hide();
  });

});

