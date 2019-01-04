$(document).ready(function () {

    var hidePages = function(pages) {
      pages.forEach( function(page) {
        $(page).trigger('hide');
        $(page).hide();
        $(page).trigger('hidden');
      });
    };

     var showPage = function(pages, pageId) {
       hidePages(pages);
       pages.forEach( function(page) {
         if (page.id === pageId) {
           $(page).trigger('show');
           $(page).show();
           $(page).trigger('shown');
         }
       });
     };

     var materializePage = new Shiny.InputBinding();
     $.extend(materializePage, {
         find: function (scope) {
             return $(scope).find(".materialize-page");
         },
         getValue: function (el) {
             return $(el).val();
         },
         subscribe: function (el, callback) {
             $(el).on("change.materialize-page", function (e) {
                 callback();
             });
         },
         unsubscribe: function (el) {
             $(el).off(".materialize-page");
         },
         receiveMessage: function(el, data) {
           var $el = $(el);

            if (data.active !== undefined) {
               var pages = document.querySelectorAll('.materialize-page');
               if (data.active === true) {
                 showPage(pages, $el.attr('id'));
                 $el.prop('active', true);
                  var targets = document.querySelectorAll('.materialize-navbar ul li a[href] , .materialize-dropdown ul li a[href]', '.materialize-sidenav ul li a[href]');
                  targets.forEach( function(li) {
                    li.parentNode.classList.remove("active");
                    if (li.getAttribute("href").replace(/#/g, '') === $el.attr('id')) {
                      li.parentNode.classList.add("active");
                    }
                  });
               }
               $el.change();
            }
         }

      });

   Shiny.inputBindings.register(materializePage, "materialize.page");
 });
