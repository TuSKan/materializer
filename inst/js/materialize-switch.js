$(document).ready(function(){

var materializeSwitch = new Shiny.InputBinding();
$.extend(materializeSwitch, {
  find: function(scope) {
    return $(scope).find(".materialize-switch");
  },
  getValue: function(el) {
    return $(el).val();
  },
  subscribe: function(el, callback) {
    $(el).on("change.materialize-switch", function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".materialize-switch");
  }
});

Shiny.inputBindings.register(materializeSwitch);
});
