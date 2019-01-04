$(document).ready(function(){

var materializeSwitch = new Shiny.InputBinding();
$.extend(materializeSwitch, {
  find: function(scope) {
    return $(scope).find(".materialize-switch");
  },
  getValue: function(el) {
    return $(el).find('input').prop('checked');
  },
  subscribe: function(el, callback) {
    $(el).on("change.materialize-switch", function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".materialize-switch");
  },
  receiveMessage: function(el, data) {
   var $el = $(el);

    if (data.value !== undefined) {
      $el.find("input").val(data.value).change();
    }
    if (data.labelon !== undefined) {
      $el.find("label").text(data.labelon).change();
    }
    if (data.labeloff !== undefined) {
      $el.find("label").text(data.labeloff).change();
    }
    if (data.value !== undefined) {
      $el.find('input').prop('checked', data.value).change();
    }
    if (data.disabled !== undefined) {
      $el.find('input').prop('disabled', data.disabled).change();
    }
 }
});

Shiny.inputBindings.register(materializeSwitch, "materialize.switch");
});
