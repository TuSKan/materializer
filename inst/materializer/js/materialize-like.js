$(document).ready(function () {
      $(".materialize-like").on("click", function () {
         var el = $(this).find("i");
        if (el.text() === "thumb_up") {
           el.text("thumb_down");
         }
         else if (el.text() === "thumb_down") {
            el.text("thumb_up");
         }
         $(this).change();
      });

     var materializeLike = new Shiny.InputBinding();
     $.extend(materializeLike, {
         find: function (scope) {
             return $(scope).find(".materialize-like");
         },
         getValue: function (el) {
             return $(el).find("i").text() === "thumb_up";
         },
         subscribe: function (el, callback) {
             $(el).on("change.materialize-like", function (e) {
                 callback();
             });
         },
         unsubscribe: function (el) {
             $(el).off(".materialize-like");
         },
         receiveMessage: function(el, data) {
            var $el = $(el);
            if(data.liked !== undefined) {
               if (data.liked) {
                  $el.find("i").text("thumb_up");
               }
               else {
                  $el.find("i").text("thumb_down");
               }

            }
            $el.change();
         }

      });

   Shiny.inputBindings.register(materializeLike, "materialize.like");
 });
