#' Create a materialize button
#'
#' Build a materialize button. The initial value is zero, and increases by one on each press.
#' @param inputId String. The input identifier used to access the value.
#' @param label String. The button text.
#' @param icon String. The name of the icon. Leave empty for no icon. Visit \url{http://materializecss.com/icons.html} for a list of available icons.
#' @param class String. Aditional class for button. Value should be round, floating, large and small.
#' @param depth Integer. The amount of depth of the button. The value should be between 0 and 5. Leave empty for the default depth.
#' @param color String. The hex codes color of the check. Leave empty for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @examples
#' material_button(
#'   inputId = "example_button",
#'   label = "Button",
#'   icon = "cloud",
#'   depth = 5,
#'   color = "blue lighten-2"
#' )
#' @export
material_button <- function(inputId, label, icon = NULL, class = NULL, target = NULL, depth = NULL, color = NULL) {
  shiny::tags$button(
    id = inputId,
    class =
      paste(
        "waves-effect waves-light btn materialize-button",
        ifDef(class, "btn-"),
        ifDef(depth, "z-depth-"),
        ifDef(material_colormap(color))
      ),
    value = 0,
    if (!is.null(icon)) shiny::tags$i(class = "material-icons left", icon),
    label,
    includeInHead(
      "materialize-button.js",
      "materialize-button.css"
    )
  )
}




