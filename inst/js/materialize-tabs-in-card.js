$(document).ready(function(){

   $(document).on("click", "li.tab a", function () {
     $(this).trigger("shown");
});
  $(".materialize-tab-content").css("visibility", "visible");

  $(".card-title").remove();

  $(".card-tabs").each(function (){
    $(this).insertBefore($(this).parent());
});

})
