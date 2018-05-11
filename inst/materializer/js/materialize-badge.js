$(document).ready(function () {

     var materializeBadge = new Shiny.InputBinding();
     $.extend(materializeBadge, {
         find: function (scope) {
             return $(scope).find(".materialize-badge");
         },
         getValue: function (el) {
             return $(el).val();
         },
         subscribe: function (el, callback) {
             $(el).on("change.materialize-badge", function (e) {
                 callback();
             });
         },
         unsubscribe: function (el) {
             $(el).off(".materialize-badge");
         },
         receiveMessage: function(el, data) {
           var $el = $(el);

            if (data.label !== undefined) {
              $el.prop('data-badge-caption',data.label).change();
            }
         }

      });

   Shiny.inputBindings.register(materializeBadge, "materialize.badge");
 });
