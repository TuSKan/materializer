$(document).ready(function () {

    var materializeNumberBox = new Shiny.InputBinding();
    $.extend(materializeNumberBox, {
        find: function (scope) {
            return $(scope).find(".materialize-number-box");
        },
        getValue: function (el) {
            return $(el).val();
        },
        subscribe: function (el, callback) {
            $(el).on("change.materialize-number-box", function (e) {
                callback();
            });
        },
        unsubscribe: function (el) {
            $(el).off(".materialize-number-box");
        }
    });

    Shiny.inputBindings.register(materializeNumberBox);
});
