$(document).ready(function(){
  var ps = [];
  var elems = document.querySelectorAll('.materialize-page, .materialize-card');
  elems.forEach( function(el,id, list) {
    ps.push(new PerfectScrollbar(el));
  });
});
