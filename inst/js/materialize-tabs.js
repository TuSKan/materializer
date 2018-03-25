$(document).ready(function(){
  //$('ul.tabs').tabs();
  $(document).on("click", "li.tab a", function () {
    $(this).trigger("shown");
});
  $(".materialize-tab-content").css("visibility", "visible")
})


