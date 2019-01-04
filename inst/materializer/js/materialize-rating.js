$(document).ready(function () {

     var materializeRating = new Shiny.InputBinding();
     $.extend(materializeRating, {
         find: function (scope) {
             return $(scope).find(".materialize-rating");
         },
         getValue: function (el) {
              var stars = $(el).find("input");
              var value = 0;
             for (var i = 0; i < stars.length; i++) {
                 if (stars[i].checked) {
                    value = stars[i].value;
                 }
             }
             return value;
         },
         getState: function(el) {
           return {

           };
         },
         subscribe: function (el, callback) {
             $(el).on("change.materialize-rating", function (e) {
                 callback();
             });
         },
         unsubscribe: function (el) {
             $(el).off(".materialize-rating");
         },
         receiveMessage: function(el, data) {
            var $el = $(el);
            var stars = $el.find("input");

            var i = 0;
            if (data.checked !== undefined) {
              for (i = 0; i < stars.length; i++) {
                 if (stars[i].value === data.checked.toString()) {
                    stars[i].checked = true;
                 }
                 else {
                    stars[i].checked = false;
                 }
              }
            }

            if (data.disabled !== undefined) {
              for (i = 0; i < stars.length; i++) {
                  stars[i].disabled = data.disabled;
              }
            }

            $el.change();
         }

      });

   Shiny.inputBindings.register(materializeRating, "materialize.rating");
 });
