$(document).ready(function(){
  //M.AutoInit();
  var ps = [];
  var elems = document.querySelectorAll('.materialize-body, .sidenav, .modal-content');
  elems.forEach( function(el,id, list) {
    ps.push(new PerfectScrollbar(el));
  });
});
