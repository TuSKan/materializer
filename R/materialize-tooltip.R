#' Include a tooltip in any tga list
#'
#' Include a tooltip in any taglist
#' @param tagList tagList The UI elements
#' @param tooltip String. The tooltip message.
#' @param position String. The position of the tooltip. Values should be 'top', 'right', 'bottom', 'left'.
#' @param delay Integer. The delay time before tooltip desappears.
#' @examples
#' require(materializer)
#' material_tooltip(
#'   material_button(
#'     inputId = "example_button",
#'     label = "Button",
#'     icon = "cloud"
#'   ),
#'   tooltip = "Open the Cloud"
#' )
#' @export
material_tooltip <- function(tagList, tooltip, position = "bottom", delay = 50) {
  shiny::tagAppendChild(
    shiny::tagAppendAttributes(
      tagList,
      class = "tooltipped",
      "data-tooltip" = tooltip,
      "data-position" = position,
      "data-delay" = delay
    ),
    includeInHead(
      "materialize-tooltip.js"
    )
  )
}




