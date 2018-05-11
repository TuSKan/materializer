$(document).ready(function () {
    $(".materialize-button").on("click", function () {
        var el = $(this);
        var curVal = parseInt(el.val());
        el.val(curVal + 1);
        el.trigger("change");
    });

    var materializeButton = new Shiny.InputBinding();
    $.extend(materializeButton, {
        find: function (scope) {
            return $(scope).find(".materialize-button");
        },
        getValue: function (el) {
            return parseInt($(el).val());
        },
        subscribe: function (el, callback) {
            $(el).on("change.materialize-button", function (e) {
                callback();
            });
        },
        unsubscribe: function (el) {
            $(el).off(".materialize-button");
        }
    });

    Shiny.inputBindings.register(materializeButton);
});
