$(document).ready(function () {

      var placeholder = $('.chips-placeholder').attr("data-placeholder");
      var initial = JSON.parse($('.chips-initial').attr("data-initial"));
      var autocomplete = JSON.parse($('.chips-autocomplete').attr("data-autocomplete"));
     $('.materialize-tags').chips({
        data: initial,
        placeholder: placeholder,
        secondaryPlaceholder: placeholder,
        autocompleteOptions: {
         data: autocomplete,
          limit: Infinity,
          minLength: 1
        }
     });

     var materializeTags = new Shiny.InputBinding();
     $.extend(materializeTags, {
         find: function (scope) {
             return $(scope).find(".materialize-tags");
         },
         getValue: function (el) {
             return M.Chips.getInstance(el).chipsData;
         },
         subscribe: function (el, callback) {
             $(el).on("change.materialize-tags", function (e) {
                 callback();
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
                     instance.deleteChip(tag);
              });
              }
              else {
                 instance.deleteChip(data.deltags);
              }
           }
           if (data.seltags !== undefined) {
              if (data.seltags.length !== undefined) {
                  $.each(data.seltags, function(tag) {
                     instance.selectChip(tag);
              });
              }
              else {
                 instance.selectChip(data.seltags);
              }
           }
         }
      });

   Shiny.inputBindings.register(materializeTags, "materialize.tags");
 });
