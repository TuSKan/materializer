#' Create a materialize date picker
#'
#' Build a materialize date picker.
#' @param inputId String. The input identifier used to access the value.
#' @param label String. The date picker label.
#' @param color String. The hex codes color of the picker. Leave empty for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors. \emph{This input requires using color hex codes, rather than the word form. E.g., "#ef5350", rather than "red lighten-1".}
#' @examples
#' material_date_picker(
#'   inputId = "example_date_picker",
#'   label = "Date Picker"
#' )
#' @export
material_date_picker <- function(inputId, label, color = NULL) {
  if (is.null(color)) color <- default_color
  color <- material_colormap(color)


  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::includeScript(
          system.file(
            file.path("js", "materialize-date-picker.js"),
            package = "materialize"
          )
        )
      )
    ),
    shiny::tagList(
      shiny::tags$head(
        shiny::tags$style(
          paste0(
            "
            #", inputId, "_root .picker__date-display {
            background-color: ", color, ";
            }

            #", inputId, "_root .picker__close, .picker__today {
            color: ", color, ";
            }

            #", inputId, "_root .picker, .picker--opened, picker__day--infocus, .picker__day--selected:hover, picker__day--highlighted, .picker--focused {
            background-color: ", color, ";
            }

            #", inputId, "_root .picker__day--today {
            color: ", color, ";
            }
            #", inputId, "_root .picker__day--selected {
            background-color: ", color, ";
            color: #fff;
            }

            #", inputId, "_root .picker__nav--prev:hover, .picker__nav--next:hover {
            background: ", color, ";
            opacity: .5
            }
            "
          )
        )
      )
    ),
    shiny::tagList(
      shiny::tags$label(
        "for" = inputId,
        label
      ),
      shiny::tags$input(
        type = "date",
        class = "datepicker materialize-date-picker",
        id = inputId
      )
    )
  )
}
