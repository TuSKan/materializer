#' Place UI content within a tab
#'
#' Use this function to create tabs in your application.
#' @param inputId String. The input identifier used to access the value.
#' @param tabs Named vector. The tab display names and corresponding tab ids.
#' @param ... tagList. The material_tab_content elements
#' @param active logical Which tab should be actived
#' @param incard Logical. This tabs willinsert in a card ?
#' @param color String. The color name of the tabs. Leave blank for 'teal lighten-1' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param bgcolor String. The hex code background color of the tabs. Leave blank for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param session Shiny default reactive domain.
#'
#' @examples
#' require(materializer)
#' material_tabs(
#'   tabs = c(
#'     "Example Tab 1" = "example_tab_1",
#'     "Example Tab 2" = "example_tab_2"
#'   ),
#'   material_tab_content(
#'     inputId = "example_tab_1",
#'     shiny::h5("Content of Example Tab 1")
#'   ),
#'   material_tab_content(
#'     inputId = "example_tab_2",
#'     shiny::h5("Content of Example Tab 2")
#'   )
#' )
#' @export
material_tabs <- function(inputId, tabs, ..., active = NULL, incard = FALSE, color = NULL, bgcolor = NULL) {

  if (is.null(color)) color <- default_color
  colornm <- css.names(color)
  colorhex <- material_colormap(color)

  nmtabs <- names(tabs)
  hftabs <- unname(tabs)
  if (is.null(nmtabs)) nmtabs <- hftabs
  if (!is.character(active)) active <- hftabs[active]
  active <- hftabs %in% active

  shiny::tags$div(
    class = paste("materialize-tabs", bgcolor),
    id = inputId,
    shiny::tags$div(
      class = if (incard) "cards-tabs",
      shiny::tags$ul(
        class = paste(
          "tabs tabs-fixed-width",
          paste0("tabs-",colornm),
          if (is.null(bgcolor)) "tabs-transparent"
        ),
        lapply(
          seq_along(tabs),
          function(t) {
            shiny::tags$li(
              class = "tab",
              shiny::tags$a(
                class = if (active[[t]]) "active",
                href = paste0("#", hftabs[[t]]),
                nmtabs[[t]]
              )
            )
          }
        )
      )
    ),
    shiny::tags$div(
      class = paste(if (incard) "card-content", if (!is.null(bgcolor)) bgcolor),
      ...
    ),
    includeInHead(
      "materialize-tabs.js",
      "materialize-tabs.css",
      style = paste0(
        '.tabs {
          background-color: transparent !important;
        }
        .tabs-', colornm, ' .indicator {
            background-color: ', colorhex, ' !important;
          }
        .tabs-', colornm, ' .tab a,
        .tabs-', colornm, ' .tab.disabled a,
        .tabs-', colornm, ' .tab.disabled a:hover {
          color: rgba(', paste(hex2rgb(colorhex),collapse = ","),',0.6) !important;
        }

        .tabs-', colornm, ' .tab a:hover,
        .tabs-', colornm, ' .tab a.active {
          color: ', colorhex, ' !important;
        }
        .tabs-', colornm, ' .tab a:focus {
           background-color: transparent !important;
        }
        .tabs-', colornm, ' .tab a:focus.active {
          background-color: rgba(', paste(hex2rgb(colorhex),collapse = ","),',0.1) !important;
        }'
      )
    )
  )
}

#' @rdname material_tabs
#' @export
update_material_tabs <- function(inputId, active = NULL, session = shiny::getDefaultReactiveDomain()) {
  session$sendInputMessage(
    inputId,
    cleanList(
      active = active
    )
  )
}

#' Place UI content within a tab content
#'
#' Use this function to create a tab content in your application.
#' @param inputId String. The input identifier used to access the value.
#' @param ... tagList. The UI elements to be insertin the tab content
#' @export
material_tab_content <- function(inputId, ...) {
  shiny::tags$div(
    class = "materialize-tab-content",
    id = inputId,
    ...
  )
}
