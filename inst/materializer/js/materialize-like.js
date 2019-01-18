$(document).ready(function () {
      $(".materialize-like").on("click", function () {
         var el = $(this).find("i");
        if (el.text() === "thumb_up") {
           el.text("thumb_down");
           el.removeClass("grey-text text-lighten-2");
           el.removeClass("green-text text-lighten-2");
           el.addClass("red-text text-lighten-2");
         }
         else if (el.text() === "thumb_down") {
            el.text("thumbs_up_down");
            el.removeClass("green-text text-lighten-2");
            el.removeClass("red-text text-lighten-2");
            el.addClass("grey-text text-lighten-2");
         }
         else if (el.text() === "thumbs_up_down") {
            el.text("thumb_up");
            el.removeClass("red-text text-lighten-2");
            el.removeClass("grey-text text-lighten-2");
            el.addClass("green-text text-lighten-2");
         }
         $(this).change();
      });

     var materializeLike = new Shiny.InputBinding();
     $.extend(materializeLike, {
         find: function (scope) {
             return $(scope).find(".materialize-like");
         },
         getValue: function (el) {
            var value;
            switch ($(el).find("i").text()) {
              case "thumb_up":
                value = true;
                break;
              case "thumb_down":
                value = false;
                break;
              case "thumbs_up_down":
                value = null;
            }
            return value;
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
            if (data.disabled !== undefined) {
               $(el).css("pointer-events", data.disabled ? "none" : "auto");
            }

            var $el = $(el).find("i");
            if (data.liked === undefined) {
               $el.text("thumbs_up_down");
               $el.removeClass("red-text text-lighten-2");
               $el.removeClass("green-text text-lighten-2");
               $el.addClass("grey-text text-lighten-2");
            }
            else if (data.liked === true) {
               $el.text("thumb_up");
               $el.removeClass("red-text text-lighten-2");
               $el.removeClass("grey-text text-lighten-2");
               $el.addClass("green-text text-lighten-2");
            }
            else if (data.liked === false) {
               $el.text("thumb_down");
               $el.removeClass("grey-text text-lighten-2");
               $el.removeClass("green-text text-lighten-2");
               $el.addClass("red-text text-lighten-2");
            }
            $(el).change();
         }

      });

   Shiny.inputBindings.register(materializeLike, "materialize.like");
 });
