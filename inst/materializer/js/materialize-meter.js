$(document).ready(function () {

     var materializeMeter = new Shiny.InputBinding();
     $.extend(materializeMeter, {
         find: function (scope) {
             return $(scope).find(".materialize-meter");
         },
         getValue: function (el) {
             return $(el).value;
         },
         subscribe: function (el, callback) {
             $(el).on("change.materialize-meter", function (e) {
                 callback();
             });
         },
         unsubscribe: function (el) {
             $(el).off(".materialize-meter");
         },
         receiveMessage: function(el, data) {
            var $el = $(el);
            if(data.value !== undefined) $el.value = data.value;
            if(data.min !== undefined) $el.min = data.min;
            if(data.max !== undefined) $el.max = data.max;
            if(data.low !== undefined) $el.low = data.low;
            if(data.high !== undefined) $el.high = data.high;
            if(data.optimum !== undefined) $el.optimum = data.optimum;
            $el.change();
         }

      });

   Shiny.inputBindings.register(materializeMeter, "materialize.meter");
 });
