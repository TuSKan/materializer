$(document).ready(function () {

    var shinyMaterialTextBox = new Shiny.InputBinding();
    $.extend(shinyMaterialTextBox, {
        find: function (scope) {
            return $(scope).find(".shiny-material-text");
        },
        getValue: function (el) {
            return $(el).find("input").val();
        },
        subscribe: function (el, callback) {
            $(el).on("change.shiny-material-text", function (e) {
                callback();
            });
        },
        unsubscribe: function (el) {
            $(el).off(".shiny-material-text");
        },
        receiveMessage: function(el, data) {
           var $el = $(el);

            if (data.label !== undefined) {
              $el.find("label")
              .text(data.label).change();
              return;
            }
            if (data.placeholder !== undefined) {
              $el.find("input")
              .prop("placeholder", data.placeholder).change();
              M.updateTextFields();
              return;
            }
            if (data.readonly !== undefined) {
              $el.find("input")
              .prop("disabled", data.readonly).change();
              return;
            }
            if (data.help !== undefined) {
              $el.find("span")
              .text(data.help).change();
              return;
            }
         }
    });

    Shiny.inputBindings.register(shinyMaterialTextBox);
});
