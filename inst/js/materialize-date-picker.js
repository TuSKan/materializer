$(document).ready(function () {

    function initmaterializeDatePicker(callback) {
        $('.datepicker').pickadate({});
        callback();
    }

    initmaterializeDatePicker(function () {

        var materializeDatePicker = new Shiny.InputBinding();

        $.extend(materializeDatePicker, {
            find: function (scope) {
                return $(scope).find(".materialize-date-picker");
            },
            getValue: function (el) {
                return $(el).val();
            },
            subscribe: function (el, callback) {
                $(el).on("change.materialize-date-picker", function (e) {
                    callback();
                });
            },
            unsubscribe: function (el) {
                $(el).off(".materialize-date-picker");
            }
        });

        Shiny.inputBindings.register(materializeDatePicker);
    });
});
