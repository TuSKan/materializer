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
 var elemSNav = document.querySelector('.materialize-sidenav .sidenav');
 var sidenav = M.Sidenav.init(elemSNav, {});
 //   onOpenStart: function () {
//      var width = this.el.getAttribute("data-width");
//      this.el.style.width = width + 'px';
//      document.body.style.paddingLeft = this.isFixed * width + 'px';
//      var header = document.querySelector('header');
//      if (header !== null) heaser.style.paddingLeft = this.isFixed * width + 'px';
//      var footer = document.querySelector('footer');
//      if (footer !== null) footer.style.paddingLeft = this.isFixed * width + 'px';
//      $('sidenav-trigger').trigger('show');
//      $('sidenav-trigger').show();
//      $('sidenav-trigger').trigger('shown');
//    },
//    onCloseEnd: function () {
//      document.body.style.paddingLeft = 0;
//      var header = document.querySelector('header');
//      if (header !== null) heaser.style.paddingLeft = 0;
//      var footer = document.querySelector('footer');
//      if (footer !== null) footer.style.paddingLeft = 0;
//      $('sidenav-trigger').trigger('hide');
//      $('sidenav-trigger').hide();
//      $('sidenav-trigger').trigger('hidden');
//    }
//  });

  // Initialize collapsible
  var elemColl = document.querySelectorAll('.materialize-sidenav .collapsible');
  M.Collapsible.init(elemColl);

  var pages = document.querySelectorAll('.materialize-page');

  var list = document.querySelectorAll('.materialize-sidenav li a[href]');

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
