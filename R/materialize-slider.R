#' Create a materialize slider
#'
#' Build a materialize slider.
#' @param inputId String. The input identifier used to access the value.
#' @param label String. The slider label.
#' @param min_value Number. The minimum value on the slider.
#' @param max_value Number. The maximum value on the slider.
#' @param initial_value Number. The initial value of the slider.
#' @param color String. The slider color hex codes. Leave empty for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors. \emph{This input requires using color hex codes, rather than the word form. E.g., "#ef5350", rather than "red lighten-1".}
#' @examples
#' material_slider(
#'   inputId = "example_slider",
#'   label = "slider",
#'   min_value = 5,
#'   max_value = 15,
#'   initial_value = 10,
#'   color = "#ef5350"
#' )
#' @export
material_slider <- function(inputId, label, min_value = 0, max_value = 100, initial_value = min_value, color = NULL) {
  if (is.null(color)) color <- default_color

  shiny::tagList(
    shiny::tags$head(
      shiny::includeScript(
        system.file(
          file.path("js", "materialize-slider.js"),
          package = "materialize"
        )
      ),
      shiny::includeCSS(
        system.file(
          file.path("css", "materialize-slider.css"),
          package = "materialize"
        )
      ),
      shiny::tags$style(
        paste0(
          "input[type=range].slider-", css.names(material_colormap(color)), "::-webkit-slider-thumb {
              background-color: ", color, ";
            }
            input[type=range].slider-", css.names(material_colormap(color)), "::-moz-range-thumb {
              background-color: ", color, ";
            }
            input[type=range].slider-", css.names(material_colormap(color)), "::-ms-thumb {
              background-color: ", color, ";
            }
            input[type=range].slider-", css.names(material_colormap(color)), " + .thumb {
              background-color: ", color, ";
            }
            input[type=range].slider-", css.names(material_colormap(color)), " + .thumb.active .value {
              color: white;
            }"
        )
      )
    ),
    shiny::tagList(
      shiny::tags$form(
        action = "#",
        shiny::tags$p(
          class = "range-field",
          id = paste0(inputId, "_range"),
          shiny::tags$label(
            `for` = paste0(inputId, "_range"),
            label
          ),
          shiny::tags$input(
            type = "range",
            id = inputId,
            class = paste("materialize-slider", paste0("slider-", css.names(material_colormap(color)))),
            min = min_value,
            max = max_value,
            value = initial_value
          )
        )
      )
    )
  )
}
