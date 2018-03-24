#' Create a shinymaterial page
#'
#' Build a shinymaterial page.
#' @param ... The UI elements to place in the page.
#' @param title String. The title of the page.
#' @param nav_bar_fixed Boolean. Should the nav bar remain fixed on the screen?
#' @param nav_bar_color Color of the nav bar. Leave blank for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param background_color Page background color. Leave blank for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param font_color String. The title font color. Leave blank for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors. \emph{Title color requires using word forms of colors (e.g. "deep-purple"). Also, lighten or darken effects do not work on title colors.}
#' @param include_fonts Boolean. Should the material font files be included? (This will place the font sources in a directory 'www', at the same location as the app code.)
#' @examples
#' material_page(
#'   title = "Example Title",
#'   nav_bar_fixed = TRUE,
#'   nav_bar_color = "red lighten-2",
#'   background_color = "blue lighten-4",
#'   shiny::tags$h1("Page Content")
#' )
#' @export
material_page <- function(..., title = "", nav_bar_fixed = FALSE, nav_bar_color = NULL, background_color = "grey lighten-4", font_color = NULL, include_fonts = FALSE){

  if (include_fonts) fontsCopy()

  material_nav_bar <- NULL

  shiny::tags$html(
    # Head --------------------------------------------------------------------
    shiny::tags$head(
      shiny::includeCSS(
        system.file("materialize/css/materialize.min.css",
                    package = "shinymaterial")
      ),
      shiny::includeCSS(
        system.file("css/shiny-material-page.css",
                    package = "shinymaterial")
      ),
      shiny::tags$meta(
        name = "viewport",
        content = "width=device-width, initial-scale=1.0"
      )
    ),
    # Body --------------------------------------------------------------------
    shiny::tags$body(
      class = background_color,
      material_nav_bar,
      ...
    ),
    shiny::includeScript(
      system.file("materialize/js/materialize.min.js",
                  package = "shinymaterial")
    ),
    shiny::includeScript(
      system.file("js/shiny-material-page.js",
                  package = "shinymaterial")
    )
  )
}
