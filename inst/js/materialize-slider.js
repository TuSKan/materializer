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
        },
        receiveMessage: function(el, data) {
           var $el = $(el);

            if (data.label !== undefined) {
              $el.closest("label")
              .text(data.label).change();
              return;
            }
            if (data.minval !== undefined) {
              $el.prop('min', data.minval).change();
              return;
            }
            if (data.maxval !== undefined) {
              $el.prop('max', data.maxval).change();
              return;
            }
            if (data.initval !== undefined) {
              $el.prop('value', data.initval).change();
              return;
            }
         }
    });

    Shiny.inputBindings.register(materializeSlider);
});
