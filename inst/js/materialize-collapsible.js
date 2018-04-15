$(document).ready(function () {
    function initmaterializeCollapsible(callback) {
        $('.collapsible').collapsible();
        var elem = document.querySelector('.collapsible.expandable');
        var instance = M.Collapsible.init(elem, {
          accordion: false
        });
        callback();
    }

    initmaterializeCollapsible(function () {

        var materializeCollapsible = new Shiny.InputBinding();
        $.extend(materializeCollapsible, {
            find: function (scope) {
                return $(scope).find("materialize-collapsible");
            },
            getValue: function (el) {
                return $(el).val();
            },
             getState: function(el, data) {
              return { value: this.getValue(el) };
            },
            subscribe: function (el, callback) {
                $(el).on("change.materialize-collapsible", function (e) {
                    callback();
                });
            },
            unsubscribe: function (el) {
                $(el).destroy();
            },
            receiveMessage: function(el, data) {
              var $el = $(el);

              if (data.cllist !== undefined) {
              $el.find('li').remove();
                $.each(data.cllist, function(index, item) {
                  $el.append(
                    '<li>' +
                      '<a href="#' + item.target + '">' +
                      ((item.icon !== undefined) ? '<i class="material-icons">' + item.icon + '</i>' : "") +
                      item.name +
                      '</a>' +
                    '</li>'
                  );
                }).change();
                return;
              }

            }
        });

        Shiny.inputBindings.register(materializeCollapsible, "materialize.collapsible");
    });
});
