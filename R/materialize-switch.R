#' Create a materialize switch
#'
#' Build a materialize switch. The value is a boolean (TRUE if 'on', FALSE if 'off').
#' @param inputId String. The input identifier used to access the value.
#' @param on String. The label for the 'on' position of the switch.
#' @param off String. The label for the 'off' position of the switch.
#' @param init Boolean. Is the switch initially on?
#' @param disabled String. The radio button should be disabled?
#' @param color String. The color name of the Switch. Leave empty for 'teal lighten-1' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param session Shiny default reactive domain.
#' @examples
#' require(materializer)
#' material_switch(
#'   inputId = "example_switch",
#'   off = "Off",
#'   on = "On",
#'   init = TRUE,
#'   color = 'teal lighten-1'
#' )
#' @export
material_switch <- function(inputId, on = "On", off = "Off", init = FALSE, disabled = FALSE, color = NULL) {

  if (is.null(color)) color <- default_color
  colornm <- css.names(color)
  colorhex <- material_colormap(color)

  shiny::div(
    id = inputId,
    class = paste(
      paste0("switch-",colornm),
      "switch",
      "materialize-switch"
    ),
    shiny::tags$label(
      off,
      shiny::tags$input(
        type = "checkbox",
        disabled = if (disabled) NA,
        checked = if (init) NA
      ),
      shiny::tags$span(
        class = "lever"
      ),
      on
    ),
    includeInHead(
      "materialize-switch.js",
      "materialize-switch.css",
      style = paste0(
        '.switch-', colornm,' input[type="checkbox"]:checked+.lever {
          background-color: rgba(', paste(hex2rgb(colorhex),collapse = ","),',0.6) !important;
        }
        .switch-', colornm,' input[type="checkbox"]:checked+.lever:after {
          background-color: rgba(', paste(hex2rgb(colorhex),collapse = ","),',1) !important;
        }'
      )
    )
  )
}

#' @rdname material_switch
#' @export
update_material_switch <- function(inputId, on = NULL, off = NULL, init = NULL, disabled = NULL, session = shiny::getDefaultReactiveDomain()) {
  session$sendInputMessage(
    inputId,
    cleanList(
      on = on,
      off = off,
      init = init,
      disabled = disabled
    )
  )
}
