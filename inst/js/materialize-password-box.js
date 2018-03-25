$(document).ready(function () {

    var materializePasswordBox = new Shiny.InputBinding();
    $.extend(materializePasswordBox, {
        find: function (scope) {
            return $(scope).find(".materialize-password-box");
        },
        getValue: function (el) {
            return $(el).val();
        },
        subscribe: function (el, callback) {
            $(el).on("change.materialize-password-box", function (e) {
                callback();
            });
        },
        unsubscribe: function (el) {
            $(el).off(".materialize-password-box");
        }
    });

    Shiny.inputBindings.register(materializePasswordBox);
});
