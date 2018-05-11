$(document).ready(function () {

    var materializeText = new Shiny.InputBinding();
    $.extend(materializeText, {
        find: function (scope) {
            return $(scope).find(".materialize-text");
        },
        getValue: function (el) {
            return $(el).val();
        },
        subscribe: function (el, callback) {
            $(el).on("change.materialize-text", function (e) {
                callback();
            });
        },
        unsubscribe: function (el) {
            $(el).off(".materialize-text");
        },
        receiveMessage: function(el, data) {
           var $el = $(el);

            if (data.value !== undefined) {
              $el.val(data.value).change();
            }
            if (data.label !== undefined) {
              $el.parent().find("label")
              .text(data.label).change();
            }
            if (data.placeholder !== undefined) {
              $el.prop("placeholder", data.placeholder).change();
              M.updateTextFields();
            }
            if (data.readonly !== undefined) {
              $el.prop("disabled", data.readonly).change();
            }
            if (data.help !== undefined) {
              $el.parent().find("span")
              .text(data.help).change();
            }
         }
    });

    Shiny.inputBindings.register(materializeText);
});
