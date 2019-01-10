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
               $el.find('card-content').remove();
               $el.append('<div class = "card-content">' + data.content + '</div>');
            }
            if(data.title !== undefined) {
               $el.find('card-title').remove();
               $el.append('<span class = "card-title">' + data.title + '</span>');
            }
            if(data.footer !== undefined) {
               $el.find('card-action').remove();
               $el.append('<div class = "card-action">' + data.footer + '</div>');
            }
            $el.change();
         }

      });

   Shiny.inputBindings.register(materializeCard, "materialize.card");
 });
