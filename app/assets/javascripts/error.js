$(document).ready(function() {

    $("#error-button").on("click", function(e) {
        if($("#lat_coord").val() === "") {
            $(".errorMessages").empty();
            $(".errorMessages").html("<li>Check your location!</li>");
        } else if($("#sender-name").val() === "" || $("#receiver-name").val() === "") {
            $(".errorMessages").empty();
            $(".errorMessages").html("<li>Name your people!</li>");
        } else if($("#spot_id").val() === "") {
            $(".errorMessages").empty();
            $(".errorMessages").html("<li>Pick a song!</li>");
        } else if($("#comment").val() === "") {
            $(".errorMessages").empty();
            $(".errorMessages").html("<li>Add a comment!</li>");
        }
    });

});
