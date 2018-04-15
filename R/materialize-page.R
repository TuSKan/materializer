#' Create a materialize page
#'
#' Build a materialize page.
#' @param ... The UI elements to place in the page.
#' @param title String. The title of the page.
#' @param footer tagList. The footerof thepage
#' @param bgcolor Page background color. Leave blank for "grey lighten-4" color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param fontcolor String. The title font color. Leave blank for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param fontoffline Boolean. Should the material font files be offline? (This will place the font sources in a directory 'www', at the same location as the app code.)
#' @examples
#' require(materializer)
#' material_page(
#'   title = "Example Title",
#'   bgcolor = "blue lighten-4",
#'   shiny::tags$h1("Page Content")
#' )
#' @export
material_page <- function(..., title = "", footer = NULL, bgcolor = "grey lighten-4", fontcolor = NULL, fontoffline = FALSE){

  if (fontoffline) fontsCopy()

  shiny::tags$html(
    # Head --------------------------------------------------------------------
    shiny::tags$head(
      if (fontoffline) {
        shiny::includeCSS(
          system.file("fonts/material-icons/material-icons.css",
                      package = "materializer")
        )
      } else {
        shiny::includeCSS(
          "https://fonts.googleapis.com/icon?family=Material+Icons"
        )
      },
      shiny::includeCSS(
        system.file("materialize/css/materialize.min.css",
                    package = "materializer")
      ),
      shiny::includeCSS(
        system.file("css/materialize-page.css",
                    package = "materializer")
      ),
      shiny::includeCSS(
        system.file("plugins/perfect-scrollbar.css",
                    package = "materializer")
      ),
      shiny::tags$meta(
        name = "viewport",
        content = "width=device-width, initial-scale=1.0"
      )
    ),
    # Body --------------------------------------------------------------------
    shiny::tags$body(
      shiny::div(
        class = paste(bgcolor, ifDef(fontcolor, "-text"), "materialize-page"),
        ...
      )
    ),
    if (!is.null(footer)) {
      shiny::tags$footer(
        class = "page-footer",
        footer
      )
    },
    shiny::includeScript(
      system.file("materialize/js/materialize.min.js",
                  package = "materializer")
    ),
    shiny::includeScript(
      system.file("plugins/perfect-scrollbar.min.js",
                  package = "materializer")
    ),
    shiny::includeScript(
      system.file("js/materialize-page.js",
                  package = "materializer")
    )
  )

}
