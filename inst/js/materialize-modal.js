$(document).ready(function () {
    $('.modal').modal();

    var modal_show = false;

    var materializeModal = new Shiny.InputBinding();
    $.extend(materializeModal, {
        find: function (scope) {
            return $(scope).find(".materialize-modal");
        },
        getValue: function (el) {
          return M.Modal.getInstance(el).isOpen;
        },
        subscribe: function (el, callback) {
            $(el).on("change.materialize-modal", function (e) {
                callback();
            });
            $('.modal-trigger').bind('click', function() {
                modal_show = true;
                Shiny.onInputChange($(el).attr('id') + '-show', modal_show);
            });
            $('.modal-close').bind('click', function() {
                modal_show = false;
                Shiny.onInputChange($(el).attr('id') + '-close', modal_show);
            });
        },
        unsubscribe: function (el) {
            $(el).off(".materialize-modal");
        }
    });

    Shiny.inputBindings.register(materializeModal);
});
