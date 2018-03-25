$(document).ready(function () {
    $('.materialize-side-nav-tab').first().addClass('active');

    var first_side_nav_tab_id = $('.materialize-side-nav-tab').first().attr("id");

    var first_side_nav_tab_content_id = $('.materialize-side-nav-tab')
        .first()
        .attr("id")
        .replace("_tab_id", "");

    var first_side_nav_tab_content_found = $('.materialize-side-nav-tab-content')
        .first()
        .attr('id');

    if (first_side_nav_tab_content_id != first_side_nav_tab_content_found) {
        alert("materialize ERROR [side-nav tabs]\n\nTab content code for the first tab must be located prior to tab content code for all other tabs.\n\nFirst tab found (" + first_side_nav_tab_id.replace("_tab_id", "") + ") does not match first tab content found (" + first_side_nav_tab_content_found + ").\n\nPlease rearrange the UI code.")

        $("body").empty();
    } else {
        $('#' + first_side_nav_tab_id).children('a').trigger('click');
    }
})
