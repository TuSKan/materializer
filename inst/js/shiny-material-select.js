$(document).ready(function () {
    function initShinyMaterialSelect(callback) {
        $('select').not('.disabled').formSelect();
        callback();
    }

    initShinyMaterialSelect(function () {

        var shinyMaterialSelect = new Shiny.InputBinding();
        $.extend(shinyMaterialSelect, {
            find: function (scope) {
                return $(scope).find("select.shiny-material-select");
            },
            getValue: function (el) {
                return $(el).val();
            },
             getState: function(el, data) {
              return { value: this.getValue(el) };
            },
            subscribe: function (el, callback) {
                $(el).on("change.shiny-material-select", function (e) {
                    callback();
                });
            },
            unsubscribe: function (el) {
                $(el).destroy();
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
                $('select').not('.disabled').formSelect();
                return;
              }

              if (data.selected !== undefined) {
                $el.val(data.selected).change();
                $('select').not('.disabled').formSelect();
                return;
              }

              if (data.label !== undefined) {
                $el.closest(".input-field").find("label").text(data.label);
                $('select').not('.disabled').formSelect();
                return;
              }

              $('select').not('.disabled').formSelect();
            }
        });

        Shiny.inputBindings.register(shinyMaterialSelect, "shiny-material.select");
    });
});
