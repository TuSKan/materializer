$(document).ready(function () {

    document.querySelectorAll('.materialize-tags').forEach(function(tag) {
      if ( tag.getAttribute("readonly") !== "readonly") {
          var initial = tag.getAttribute("data-initial");
          var placeholder = tag.getAttribute("data-placeholder");
          var autocomplete = tag.getAttribute("data-autocomplete");
          M.Chips.init(
            tag,
            {
              data: initial === undefined ? {} : JSON.parse(initial),
              placeholder: placeholder,
              secondaryPlaceholder: placeholder,
              autocompleteOptions: {
               data: autocomplete === undefined ? {} : JSON.parse(autocomplete),
                limit: Infinity,
                minLength: 1
              }
            }
          );
        }
    });

     var materializeTags = new Shiny.InputBinding();
     $.extend(materializeTags, {
         find: function (scope) {
             return $(scope).find(".materialize-tags");
         },
         getValue: function (el) {
           var tags = M.Chips.getInstance(el);
           if (tags !== undefined) {
             return tags.chipsData;
           }
           return null;
         },
         subscribe: function (el, callback) {
             $(el).on("change", function (e) {
                 callback();
                 Shiny.setInputValue($(el).attr('id'), M.Chips.getInstance(el).chipsData);
             });
             $(el).on("keydown", function (e) {
               callback();
               if(e.which == 13)
                 Shiny.setInputValue($(el).attr('id'), M.Chips.getInstance(el).chipsData);
             });
              $(el).on("click", function (e) {
                 callback();
                 Shiny.setInputValue($(el).attr('id'), M.Chips.getInstance(el).chipsData);
             });
         },
         unsubscribe: function (el) {
             $(el).off(".materialize-tags");
         },
         receiveMessage: function(el, data) {
           var instance = M.Chips.getInstance(el);
           if (data.addtags !== undefined && data.addtags !== null) {
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
           if (data.deltags !== undefined && data.addtags !== null) {
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
