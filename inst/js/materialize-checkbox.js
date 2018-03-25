$(document).ready(function () {

     var materializeCheckbox = new Shiny.InputBinding();
     $.extend(materializeCheckbox, {
         find: function (scope) {
             return $(scope).find(".materialize-checkbox");
         },
         getValue: function (el) {
             return $(el).prop("checked");
         },
         subscribe: function (el, callback) {
             $(el).on("change.materialize-checkbox", function (e) {
                 callback();
             });
         },
         unsubscribe: function (el) {
             $(el).off(".materialize-checkbox");
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

   Shiny.inputBindings.register(materializeCheckbox, "materialize.checkbox");
 });
