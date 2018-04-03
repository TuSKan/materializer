#' Create a materialize slider
#'
#' Build a materialize slider.
#' @param inputId String. The input identifier used to access the value.
#' @param label String. The slider label.
#' @param minval Number. The minimum value on the slider.
#' @param maxval Number. The maximum value on the slider.
#' @param initval Number. The initial value of the slider.
#' @param color String. The color name of the slider Leave empty for the 'teal lighten-1' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @examples
#' material_slider(
#'   inputId = "example_slider",
#'   label = "slider",
#'   minval = 5,
#'   maxval = 15,
#'   initval = 10,
#'   color = 'teal lighten-1'
#' )
#' @export
material_slider <- function(inputId, label, minval = 0, maxval = 100, initval = minval, color = NULL) {

  if (is.null(color)) color <- default_color
  colornm <- css.names(color)
  colorhex <- material_colormap(color)

  shiny::tags$p(
    class = "range-field",
    id = paste0(inputId, "Range"),
    shiny::tags$label(
      "for" = paste0(inputId, "Range"),
      label
    ),
    shiny::tags$input(
      type = "range",
      id = inputId,
      class = paste(
        "materialize-slider",
        paste0("slider-", colornm)
        ),
      min = minval,
      max = maxval,
      value = initval
    ),
    includeInHead(
      "materialize-slider.js",
      "materialize-slider.css",
      style = paste0(
        "input[type=range].slider-", colornm, "::-webkit-slider-thumb {
          background-color: ", colorhex, ";
        }
        input[type=range].slider-", colornm, "::-moz-range-thumb {
          background-color: ", colorhex, ";
        }
        input[type=range].slider-", colornm, "::-ms-thumb {
          background-color: ", colorhex, ";
        }
        input[type=range].slider-", colornm, " + .thumb {
          background-color: ", colorhex, ";
        }
        input[type=range].slider-", colornm, " + .thumb.active .value {
          color: white;
        }"
      )
    )
  )
}


#' @rdname material_slider
#' @export
update_material_slider <- function(inputId, label = NULL, minval = NULL, maxval = NULL, initval = NULL, session = shiny::getDefaultReactiveDomain()) {
  session$sendInputMessage(
    inputId,
    cleanList(
      label = label,
      minval = minval,
      maxval = maxval,
      initval = initval
    )
  )
}
