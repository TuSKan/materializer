$(document).ready(function () {
    $('.modal').modal();
    $('.modal').prop('data-show', false);

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
                $(el).prop('data-show', $(el).prop('data-show') + 1);
                Shiny.onInputChange($(el).attr('id') + '-show', $(el).prop('data-show'));
            });
            $('.modal-close').bind('click', function() {
                $(el).prop('data-show', $(el).prop('data-show') + 1);
                Shiny.onInputChange($(el).attr('id') + '-close', $(el).prop('data-show'));
            });
        },
        unsubscribe: function (el) {
            $(el).off(".materialize-modal");
        }
    });

    Shiny.inputBindings.register(materializeModal);
});
