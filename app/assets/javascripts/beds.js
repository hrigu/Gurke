$(document).ready(function() {
    $(".draggable").draggable({
        containment: 'parent',  //the draggable are catched in the parent containment
        stop: function(event, ui) {
            var bed_id = ui.helper.attr("bed_id");

            $.post("1/beds/"+bed_id+"/move_bed", { id: bed_id, position: ui.position, authenticity_token: AUTH_TOKEN},
                function(data) {
                });
            }
    });
    $(".resizable").resizable();
});
