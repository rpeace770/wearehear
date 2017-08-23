$(document).ready(function() {
   $("#new-bouquet-form").on('click', "#upload_link", function(e){
        e.preventDefault();
        console.log("button clicked!");
         $("#upload").trigger('click');
    });
  });

