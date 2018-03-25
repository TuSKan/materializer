$(document).ready(function () {

    var materializeSlider = new Shiny.InputBinding();

    $.extend(materializeSlider, {
        find: function (scope) {
            return $(scope).find(".materialize-slider");
        },
        getValue: function (el) {
            return Number($(el).val());
        },
        subscribe: function (el, callback) {
            $(el).on("change", function (e) {
                callback();
            });
        },
        unsubscribe: function (el) {
            $(el).off(".materialize-slider");
        }
    });

    Shiny.inputBindings.register(materializeSlider);
});
