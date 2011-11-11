$(document).ready(function() {
    $(".draggable").draggable({
        stop: function(event, ui) { alert("hi");}
    });
    $(".resizable").resizable();
});
