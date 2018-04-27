#' Create a materialize badge
#'
#' Build a materialize badge
#' @param inputId String. The input identifier used to access the value.
#' @param label String. The badge label
#' @param color String. The color name of the badge Leave empty for 'teal lighten-1' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param session Shiny default reactive domain.
#' @examples
#' require(materializer)
#' material_badge(
#'   inputId = "example_button",
#'   label = "4",
#'   color = "blue lighten-2"
#' )
#' @export
material_badge <- function(inputId, label = NULL, color = NULL) {
  if (is.null(color)) color <- default_color

  shiny::tags$span(
    id = inputId,
    class = paste("badge", "new", color, "materialize-badge"),
    "data-badge-caption" = label,
    includeInHead(
      "materialize-badge.js",
      style = paste0(
        'span.badge.new {
          color: #fff !important;;
        }'
      )
    )
  )
}


#' @rdname material_badge
#' @export
update_material_badge <- function(inputId, label = NULL, session = shiny::getDefaultReactiveDomain()) {
  session$sendInputMessage(
    inputId,
    cleanList(
      label = label
    )
  )
}


