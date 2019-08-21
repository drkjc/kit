$(document).ready(function () {
    $("#new_room_form").on("submit", function (event) {
        event.preventDefault();
        let values = $(this).serialize();
        $.post('/rooms', values);
    });

    $("#input").val("");
    
});