$(document).ready(function () {

    var elems = document.querySelectorAll('.materialize-fab');
    elems.forEach( function(el, id, list) {
      M.FloatingActionButton.init(el, {
        direction: el.getAttribute("data-direction"),
        hoverEnabled: el.getAttribute("data-toggle") == "hover"
      });
    });

    var materializeFab = new Shiny.InputBinding();
    $.extend(materializeFab, {
        find: function (scope) {
            return $(scope).find(".materialize-fab");
        },
        getValue: function (el) {
            return parseInt($(el).val());
        },
        subscribe: function (el, callback) {
            $(el).on("change.materialize-fab", function (e) {
                callback();
            });
        },
        unsubscribe: function (el) {
            $(el).off(".materialize-fab");
        }
    });

    Shiny.inputBindings.register(materializeFab);

});
