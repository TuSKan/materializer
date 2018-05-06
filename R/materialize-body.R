#' @include materialize-utils.R
NULL

#' Create a materialize body
#'
#' Build a materialize body
#' @param ... The UI elements to place in the body
#' @param title String. The title of the body
#' @param footer tagList. The footer of the body
#' @param bgcolor Body background color. Leave blank for "grey lighten-4" color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param fontcolor String. The title font color. Leave blank for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param offline Boolean. Should the material font files be offline? (This will place the font sources in a directory 'www', at the same location as the app code.)
#' @examples
#' require(materializer)
#' material_body(
#'   title = "Example Title",
#'   bgcolor = "blue lighten-4",
#'   shiny::tags$h1("Body Content")
#' )
#' @export
material_body <- function(..., title = "", footer = NULL, bgcolor = "grey lighten-4", fontcolor = NULL, offline = FALSE){

  if (offline) fontsCopy()

  shiny::tags$html(
    # Head --------------------------------------------------------------------
    shiny::tags$head(
      if (offline) {
        shiny::tags$link(
          href = "materializer/fonts/material-icons/material-icons.css",
          rel = 'stylesheet',
          type = 'text/css'
        )
      } else {
        shiny::tags$link(
          href = "https://fonts.googleapis.com/icon?family=Material+Icons",
          rel = 'stylesheet',
          type = 'text/css'
        )
      },
      shiny::tags$link(
        href = "materializer/materialize/css/materialize.min.css",
        rel = 'stylesheet',
        type = 'text/css'
      ),
      shiny::includeCSS(
        system.file("css/materialize-body.css",
                    package = "materializer")
      ),
      shiny::tags$link(
        href = "materializer/plugins/perfect-scrollbar.css",
        rel = 'stylesheet',
        type = 'text/css'
      ),
      shiny::tags$meta(
        name = "viewport",
        content = "width=device-width, initial-scale=1.0"
      ),
      shiny::tags$title(title)
    ),
    # Body --------------------------------------------------------------------
    shiny::tags$body(
      shiny::div(
        class = paste(bgcolor, colortext(fontcolor) , "materialize-body"),
        ...
      )
    ),
    if (!is.null(footer)) {
      shiny::tags$footer(
        class = "page-footer",
        footer
      )
    },
    shiny::tags$script(
      src = "materializer/materialize/js/materialize.min.js"
    ),
    shiny::tags$script(
      src = "materializer/plugins/perfect-scrollbar.min.js"
    ),
    shiny::includeScript(
      system.file("js/materialize-body.js",
                  package = "materializer")
    )
  )

}
