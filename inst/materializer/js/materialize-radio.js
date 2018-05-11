$(document).ready(function () {

    var materializeRadio = new Shiny.InputBinding();
    $.extend(materializeRadio, {
        find: function (scope) {
            return $(scope).find(".materialize-radio");
        },
        getValue: function (el) {
            return $(el).find('input:checked').val();
        },
        subscribe: function (el, callback) {
            $(el).on("change.materialize-radio", function (e) {
                callback();
            });
        },
        unsubscribe: function (el) {
            $(el).off(".materialize-radio");
        },
        receiveMessage: function(el, data) {
          var $el = $(el);

          if (data.choices !== undefined) {
            var name = $el.find('input').prop('name');
            var type = $el.find('input').prop('class');
            var inline = $el.find('p').prop('class');
            $el.empty();
            $.each(data.choices, function(index, item) {
              $el.append(
                '<p class="' + inline + '"> \n'+
                  '<label> \n'+
                    '<input type="radio" name="' + name + '" class="' + type + '" value="' + data.values[index] + '">\n'+
                    '<span>' + item + '</span>\n'+
                  '</label> \n'+
                '</p>'
              ).change();
            });
          }

          if (data.selected !== undefined) {
            $el.find('input:eq('+ (data.selected -1) + ')').prop('checked', true).change();
          }

          if (data.disabled !== undefined) {
            $el.find('input:eq('+ (data.disabled -1) + ')').prop('disabled', true).change();
          }
        }
    });

    Shiny.inputBindings.register(materializeRadio);
});
