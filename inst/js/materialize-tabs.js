$(document).ready(function () {
    function initmaterializeTabs(callback) {
        $('.tabs').tabs();
        callback();
    }

    initmaterializeTabs(function () {

        var materializeTabs = new Shiny.InputBinding();
        $.extend(materializeTabs, {
            find: function (scope) {
                return $(scope).find(".materialize-tabs");
            },
            getValue: function (el) {
              return $(el).find("a.active").attr("href");
            },
            setValue: function(el, value) {
              var instance = M.Tabs.getInstance($(el).find('.tabs'));
              instance.select(value);
              $(el).change();
            },
            getState: function(el) {
              return { value: this.getValue(el) };
            },
            subscribe: function (el, callback) {
                $(el).on("change.materialize-tabs", function (e) {
                    callback();
                });
            },
            unsubscribe: function (el) {
              $(el).off(".materialize-tabs");
            },
            receiveMessage: function(el, data) {
              var $el = $(el);
              if (data.active !== undefined) {
                this.setValue(el, data.active);
              }
            }
        });

        Shiny.inputBindings.register(materializeTabs);
    });
});
