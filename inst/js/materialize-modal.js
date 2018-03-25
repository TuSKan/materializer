$(document).ready(function () {
    $('.modal').modal({
        dismissible: false
    });
    $(document).on("click", ".materialize-modal-trigger", function () {
        $(this).trigger("shown");
    });
});
