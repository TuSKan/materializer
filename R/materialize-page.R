#' Create a container to organize UI content
#'
#' UI content can be insert in a container to organize items on a page.
#' @param inputId String. The input identifier used to access the value.
#' @param ... tagList. UI content list
#' @param bgcolor String. The color name for Sidenav backgroud. Leave empty for 'transparent' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param fontcolor String. The color name for links and icons in Sidenav Leave empty for the 'teal lighten-1' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @examples
#' require(materializer)
#' material_page(inputId = "expage", shiny::h1("Page Content"))
#' @export
material_page <- function(inputId, ..., bgcolor = "transparent", fontcolor = NULL) {
  shiny::div(
    id = inputId,
    class = paste(
      "materialize-page",
      "container",
      sub(" ", ".",trimws(bgcolor)),
      colortext(fontcolor)
    ),
    shiny::div(
      class = "section",
      ...
    ),
    includeInHead(
      "materialize-page.js"
    )
  )
}

#' @rdname material_page
#' @export
#' @param active Boolean. Show Page
#' @param session Shiny default reactive domain.
update_material_page <- function(inputId, active, session = shiny::getDefaultReactiveDomain()) {
  session$sendInputMessage(
    inputId,
    cleanList(
      active = active
    )
  )
}


#' Material Icon
#'
#' Createa material Icon element
#' @param icon String. The name of the icon. Leave empty for no icon. Visit \url{http://materializecss.com/icons.html} for a list of available icons.
#' @param align String The icon align. Values should be 'left', 'right', and 'center'
#' @param color String. The color name for links and icons in Sidenav Leave empty for the 'teal lighten-1' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @examples
#' require(materializer)
#' material_icon(icon = "cloud")
#' @export
material_icon <- function(icon, align = "left", color = NULL) {
  if (is.null(icon)) return(NULL)
  if (align == "center") align = NULL
  shiny::tags$i(
    class = paste("material-icons", align, color),
    icon)
}

