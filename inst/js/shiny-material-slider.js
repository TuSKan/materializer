$(document).ready(function () {

    var shinyMaterialSlider = new Shiny.InputBinding();

    $.extend(shinyMaterialSlider, {
        find: function (scope) {
            return $(scope).find(".shiny-material-slider");
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
            $(el).off(".shiny-material-slider");
        }
    });

    Shiny.inputBindings.register(shinyMaterialSlider);
});
