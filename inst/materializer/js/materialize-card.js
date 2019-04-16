$(document).ready(function () {

     var materializeCard = new Shiny.InputBinding();
     $.extend(materializeCard, {
         find: function (scope) {
             return $(scope).find(".materialize-card");
         },
         getValue: function (el) {
             return $(el).val();
         },
         subscribe: function (el, callback) {
             $(el).on("change.materialize-card", function (e) {
                 callback();
             });
         },
         unsubscribe: function (el) {
             $(el).off(".materialize-card");
         },
         receiveMessage: function(el, data) {
            var $el = $(el);
            if(data.content !== undefined) {
               $el.find('.card-content').html(data.content);
            }
            if(data.title !== undefined) {
               $el.find('.card-title').text(data.title);
            }
            if(data.footer !== undefined) {
               $el.find('.card-action').html(data.footer);
            }
            $el.change();
         }

      });

   Shiny.inputBindings.register(materializeCard, "materialize.card");
 });
