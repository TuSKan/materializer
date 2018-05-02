#' Create a materialize button
#'
#' Build a materialize button. The initial value is zero, and increases by one on each press.
#' @param inputId String. The input identifier used to access the value.
#' @param label String. The button text.
#' @param icon String or shiny.tag The name of the icon or a material_icon element. Leave empty for no icon. Visit \url{http://materializecss.com/icons.html} for a list of available icons.
#' @param class String. Aditional class for button. Value should be 'btn-round', 'btn-large' or 'btn-small'.
#' @param depth Integer. The amount of depth of the button. The value should be between 0 and 5. Leave empty for the default depth.
#' @param color String. The color name of the button. Leave empty for 'teal lighten-1' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @examples
#' require(materializer)
#' material_button(
#'   inputId = "example_button",
#'   label = "Button",
#'   icon = "cloud",
#'   depth = 5,
#'   color = "blue lighten-2"
#' )
#' @export
material_button <- function(inputId, label = NULL, icon = NULL, class = NULL, depth = NULL, color = NULL) {
  if (is.character(icon)) icon <- material_icon(icon, ifelse(is.null(label), "center", "left"))
  shiny::tags$button(
    id = inputId,
    class =
      paste(
        "waves-effect waves-light btn materialize-button",
        ifDef(class),
        ifDef(depth, "z-depth-"),
        ifDef(color)
      ),
    value = 0,
    icon,
    label,
    includeInHead(
      "materialize-button.js",
      "materialize-button.css"
    )
  )
}




