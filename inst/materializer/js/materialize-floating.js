$(document).ready(function () {

    var elems = document.querySelectorAll('.fixed-action-btn');
    elems.forEach( function(el, id, list) {
      M.FloatingActionButton.init(el, {
        direction: el.getAttribute("data-direction"),
        hoverEnabled: el.getAttribute("data-toggle") == "hover"
      });
    });

    var materializeFloating = new Shiny.InputBinding();
    $.extend(materializeFloating, {
        find: function (scope) {
            return scope.querySelectorAll('.fixed-action-btn');
        },
        getValue: function (el) {
            return parseInt($(el).val());
        },
        subscribe: function (el, callback) {
            $(el).on("change.materialize-floating", function (e) {
                callback();
            });
        },
        unsubscribe: function (el) {
            $(el).off(".materialize-floating");
        }
    });

    Shiny.inputBindings.register(materializeFloating);
});
