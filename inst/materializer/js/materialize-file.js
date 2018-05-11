$(document).ready(function () {

    var materializeFile = new Shiny.InputBinding();
    $.extend(materializeFile, {
        find: function (scope) {
            return $(scope).find(".materialize-file");
        },
        getValue: function (el) {

          $el = $(el);

          if ($el.prop("data-side") === "server") {

            return $('cuteFileBrowser').prop("datapath");

          } else {

             function () {
                  var file = el.files[0];
           //       if (file) {
                      read = new FileReader();
          //            read.readAsDataURL(file);
           //       }

                  return read.result;
              }
          }

        },
        subscribe: function (el, callback) {
            $(el).on("change.materialize-file", function (e) {
                callback();
            });
        },
        unsubscribe: function (el) {
            $(el).off(".materialize-file");
        }
    });

    Shiny.inputBindings.register(materializeFile);
  });
