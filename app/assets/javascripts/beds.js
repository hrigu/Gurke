$(document).ready(function() {
    $(".draggable").draggable({
        containment: 'parent',  //the draggable are catched in the parent containment
        stop: function(event, ui) {
            var garden_id =  ui.helper.parent().attr("garden_id");
            var bed_id = ui.helper.attr("bed_id");

            $.post(garden_id + "/beds/"+bed_id+"/move_bed", { id: bed_id, position: ui.position, authenticity_token: AUTH_TOKEN},
                function(data) {
                });
            }
    });
    $(".resizable").resizable();
});
