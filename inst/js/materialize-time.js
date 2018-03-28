$(document).ready(function () {

    function initmaterializeTime(callback) {
        $('.timepicker').timepicker({
          twelveHour: false
        });
        callback();
    }

    initmaterializeTime(function () {

        var materializeTime = new Shiny.InputBinding();

        $.extend(materializeTime, {
            find: function (scope) {
                return $(scope).find(".materialize-time");
            },
            getValue: function (el) {
                var instance = M.Timepicker.getInstance(el);
                return instance.time;
            },
            subscribe: function (el, callback) {
                $(el).on("change.materialize-time", function (e) {
                    callback();
                });
            },
            unsubscribe: function (el) {
                var instance = M.Timepicker.getInstance(el);
                instance.destroy();
                $(el).off(".materialize-time");
            },
            receiveMessage: function(el, data) {
            var $el = $(el);

            if (data.value !== undefined) {
              $el.prop('value',data.value).change();
              return;
            }
            if (data.label !== undefined) {
              $el.parent().find("label")
              .text(data.label).change();
              return;
            }
            if (data.placeholder !== undefined) {
              $el.prop("placeholder", data.placeholder).change();
              M.updateTextFields();
              return;
            }
            if (data.readonly !== undefined) {
              $el.prop("disabled", data.readonly).change();
              return;
            }
            if (data.help !== undefined) {
              $el.parent().find("span")
              .text(data.help).change();
              return;
            }
         }
        });

        Shiny.inputBindings.register(materializeTime);
    });
});
