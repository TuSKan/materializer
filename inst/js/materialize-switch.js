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

    if (data.on !== undefined) {
      $el.find("label").text(data.on).change();
      return;
    }
    if (data.off !== undefined) {
      $el.find("label").text(data.off).change();
      return;
    }
    if (data.init !== undefined) {
      $el.find('input').prop('checked', data.init).change();
      return;
    }
    if (data.disabled !== undefined) {
      $el.find('input').prop('disabled', data.disabled).change();
      return;
    }
 }
});

Shiny.inputBindings.register(materializeSwitch);
});
