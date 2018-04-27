#' Create a container to organize UI content
#'
#' UI content can be insert in a container to organize items on a page.
#' @param inputId String. The input identifier used to access the value.
#' @param ... tagList. UI content list
#' @param bgcolor String. The color name for Sidenav backgroud. Leave empty for 'transparent' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param color String. The color name for links and icons in Sidenav Leave empty for the 'teal lighten-1' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @examples
#' require(materializer)
#' material_page(inputId = "expage", shiny::h1("Page Content"))
#' @export
material_page <- function(inputId, ..., bgcolor = "transparent", color = NULL) {
  if (!is.null(color)) color = strsplit(trimws(color), " ")[[1]]
  shiny::div(
    id = inputId,
    class = paste(
      "materialize-page",
      "container",
      sub(" ", ".",trimws(bgcolor)),
      paste(ifDef(color[1], suffix = "-text"), ifDef(color[2], prefix = "text-"), collapse = ".")
    ),
    shiny::div(
      class = "section",
      ...
    )
  )
}
