$(document).ready(function() {
    $(".draggable").draggable({
        stop: function(event, ui) {
                $("#bed").val("hallo");

            }
    });
    $(".resizable").resizable();
});
