$(document).ready(function () {

    if ( $('.materialize-tags').attr("readonly") === undefined) {
      var initial = $('.materialize-tags').attr("data-initial");
      var placeholder = $('.materialize-tags').attr("data-placeholder");
      var autocomplete = $('.materialize-tags').attr("data-autocomplete");
      $('.materialize-tags').chips({
        data: initial === undefined ? {} : JSON.parse(initial),
        placeholder: placeholder,
        secondaryPlaceholder: placeholder,
        autocompleteOptions: {
         data: autocomplete === undefined ? {} : JSON.parse(autocomplete),
          limit: Infinity,
          minLength: 1
        }
      });
    }

     var materializeTags = new Shiny.InputBinding();
     $.extend(materializeTags, {
         find: function (scope) {
             return $(scope).find(".materialize-tags");
         },
         getValue: function (el) {
             return M.Chips.getInstance(el).chipsData;
         },
         subscribe: function (el, callback) {
             $(el).on("change", function (e) {
                 callback();
             });
             $(el).on("keydown", function (e) {
               if(e.which == 13)
                 Shiny.setInputValue($(el).attr('id'), M.Chips.getInstance(el).chipsData);
             });
         },
         unsubscribe: function (el) {
             $(el).off(".materialize-tags");
         },
         receiveMessage: function(el, data) {
           var instance = M.Chips.getInstance(el);
           if (data.addtags !== undefined) {
              if (data.addtags.length !== undefined) {
                  $.each(data.addtags, function(tag) {
                     instance.addChip(tag);
                  });
              }
              else {
                 instance.addChip(data.addtags);
              }
           }
           var i = 0;
           if (data.deltags !== undefined) {
             if (data.deltags.length !== undefined) {
                  $.each(data.deltags, function(tag) {
                     instance.deleteChip(tag + 1);
                  });
              }
              else {
                 instance.deleteChip(data.deltags + 1);
              }
           }
           if (data.seltags !== undefined) {
              if (data.seltags.length !== undefined) {
                  $.each(data.seltags, function(tag) {
                     instance.selectChip(tag + 1);
                  });
              }
              else {
                 instance.selectChip(data.seltags + 1);
              }
           }
         }
      });

   Shiny.inputBindings.register(materializeTags, "materialize.tags");
 });
