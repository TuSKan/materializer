$(document).ready(function() {
  var elsnav = document.querySelector('.materialize-sidenav .sidenav');
  M.Sidenav.init(elsnav);

  // Initialize collapsible
  var elcoll = document.querySelector('.materialize-sidenav .collapsible');
  M.Collapsible.init(elcoll);
});
