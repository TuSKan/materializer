$(document).ready(function () {

     var shinyMaterialCheckbox = new Shiny.InputBinding();
     $.extend(shinyMaterialCheckbox, {
         find: function (scope) {
             return $(scope).find(".shiny-material-checkbox");
         },
         getValue: function (el) {
             return $(el).prop("checked");
         },
         subscribe: function (el, callback) {
             $(el).on("change.shiny-material-checkbox", function (e) {
                 callback();
             });
         },
         unsubscribe: function (el) {
             $(el).off(".shiny-material-checkbox");
         },
         receiveMessage: function(el, data) {
           var $el = $(el);

            if (data.label !== undefined) {
              $el.closest("label").find("span")
              .text(data.label).change();
              return;
            }

            if (data.checked !== undefined) {
              $el.prop('checked', data.checked).change();
              return;
            }
         }

      });

   Shiny.inputBindings.register(shinyMaterialCheckbox, "shiny-material.checkbox");
 });
