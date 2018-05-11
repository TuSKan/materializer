$(document).ready(function() {

// functions
  var hidePages = function(pages) {
      pages.forEach( function(page) {
        $(page).trigger('hide');
        $(page).hide();
        $(page).trigger('hidden');
      });
  };

  var showPage = function(pages, pageId) {
    hidePages(pages);
    pages.forEach( function(page) {
      if (page.id === pageId) {
        $(page).trigger('show');
        $(page).show();
        $(page).trigger('shown');
      }
    });
  };

  var findActive = function(list) {
    list.forEach( function(li) {
      if (li.parentNode.classList.contains("active"))
        return li.getAttribute("href").replace(/#/g, '');
    });
    return undefined;
  };

  // elements
  var elemSNav = document.querySelector('.materialize-navbar .sidenav');
  var sidenav = M.Sidenav.init(elemSNav);

  var pages = document.querySelectorAll('.materialize-page');

  var list = document.querySelectorAll('.materialize-navbar ul li a[href] , .materialize-dropdown ul li a[href]');

// Init
  var liactive = findActive(list);
  if (liactive === undefined) {
    list[0].parentNode.classList.add("active");
    showPage(pages, list[0].getAttribute("href").replace(/#/g, ''));
  } else {
    showPage(pages, liactive);
  }

// Click
  list.forEach( function(li) {
    li.onclick = function() {
      list.forEach( function(lirem) {lirem.parentNode.classList.remove("active");});
      li.parentNode.classList.add("active");
      showPage(pages, li.getAttribute("href").replace(/#/g, ''));
    };
  });

});
