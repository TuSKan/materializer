$(document).ready(function () {

    var materializeFileInput = new Shiny.InputBinding();
    $.extend(materializeFileInput, {
        find: function (scope) {
            return $(scope).find(".materialize-file-input");
        },
        getValue: function (el) {
           function () {
                var file = el.files[0];
         //       if (file) {
                    read = new FileReader();
        //            read.readAsDataURL(file);
         //       }

                return read.result;
            }
        },
        subscribe: function (el, callback) {
            $(el).on("change.materialize-file-input", function (e) {
                callback();
            });
        },
        unsubscribe: function (el) {
            $(el).off(".materialize-file-input");
        }
    });

    Shiny.inputBindings.register(materializeFileInput);
  });
