$(document).ready(function () {
    function initmaterializeSelect(callback) {
        $('select').not('.disabled').formSelect();
        callback();
    }

    initmaterializeSelect(function () {

        var materializeSelect = new Shiny.InputBinding();
        $.extend(materializeSelect, {
            find: function (scope) {
                return $(scope).find("select.materialize-select");
            },
            getValue: function (el) {
                return $(el).val();
            },
             getState: function(el, data) {
              return { value: this.getValue(el) };
            },
            subscribe: function (el, callback) {
                $(el).on("change.materialize-select", function (e) {
                    callback();
                });
            },
            unsubscribe: function (el) {
                $(el).off(".materialize-select");
            },
            receiveMessage: function(el, data) {
              var $el = $(el);

              if (data.choices !== undefined) {
              $el.find('option').remove();
                $.each(data.choices, function(index, item) {
                  $el.append($('<option>', {
                    value: data.values[index],
                    text: item
                  }));
                });
              }

              if (data.selected !== undefined) {
                $el.find('option[value="' + data.selected + '"]').prop('selected', true);
              }

              if (data.label !== undefined) {
                $el.closest(".input-field").find("label").text(data.label);
              }
              $el.change();
              $('select').not('.disabled').formSelect();
            }
        });

        Shiny.inputBindings.register(materializeSelect, "materialize.select");
    });
});
