$(document).ready(function () {

    function initmaterializeDate(callback) {
        $('.datepicker').datepicker({
          format: 'mmm dd, yyyy'
        });
        callback();
    }

    initmaterializeDate(function () {

        var materializeDate = new Shiny.InputBinding();

        $.extend(materializeDate, {
            find: function (scope) {
                return $(scope).find(".materialize-date");
            },
            getValue: function (el) {
                var instance = M.Datepicker.getInstance(el);
                return instance.date;
            },
            subscribe: function (el, callback) {
                $(el).on("change.materialize-date", function (e) {
                    callback();
                });
            },
            unsubscribe: function (el) {
                var instance = M.Datepicker.getInstance(el);
                instance.destroy();
                $(el).off(".materialize-date");
            },
            receiveMessage: function(el, data) {
              var $el = $(el);

              if (data.value !== undefined) {
                var instance = M.Datepicker.getInstance(el);
                instance.setDate(new Date(data.value));
                $el.prop('value', instance.date.toLocaleDateString("en-US", {month: 'short', day: "2-digit", year: "numeric"})).change();
              }
              if (data.label !== undefined) {
                $el.parent().find("label")
                .text(data.label).change();
              }
              if (data.placeholder !== undefined) {
                $el.prop("placeholder", data.placeholder).change();
                M.updateTextFields();
              }
              if (data.readonly !== undefined) {
                $el.prop("disabled", data.readonly).change();
              }
              if (data.help !== undefined) {
                $el.parent().find("span")
                .text(data.help).change();
              }
            }
        });

        Shiny.inputBindings.register(materializeDate);
    });
});
