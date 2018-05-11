$(document).ready(function () {
    function initmaterializeDropdown(callback) {
        $('.dropdown-trigger').dropdown();
        callback();
    }

    initmaterializeDropdown(function () {

        var materializeDropdown = new Shiny.InputBinding();
        $.extend(materializeDropdown, {
            find: function (scope) {
                return $(scope).find("materialize-dropdown");
            },
            getValue: function (el) {
                return $(el).val();
            },
             getState: function(el, data) {
              return { value: this.getValue(el) };
            },
            subscribe: function (el, callback) {
                $(el).on("change.materialize-dropdown", function (e) {
                    callback();
                });
            },
            unsubscribe: function (el) {
                $(el).destroy();
            },
            receiveMessage: function(el, data) {
              var $el = $(el);

              if (data.ddlist !== undefined) {
              $el.find('li').remove();
                $.each(data.ddlist, function(index, item) {
                  $el.append(
                    '<li>' +
                      '<a href="#' + item.target + '">' +
                      ((item.icon !== undefined) ? '<i class="material-icons">' + item.icon + '</i>' : "") +
                      item.name +
                      '</a>' +
                    '</li>'
                  );
                }).change();
              }

            }
        });

        Shiny.inputBindings.register(materializeDropdown, "materialize.dropdown");
    });
});
