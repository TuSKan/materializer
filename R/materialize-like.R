#' Create a materialize like element
#'
#' Build a materialize like and dislike element
#' @param inputId String. The input identifier used to access the value.
#' @param liked Boolian. The initial status of the element
#' @param size String. Size of icon, could be 'tiny' (1rem), 'small' (2rem), 'medium' (4rem) and 'large' (6rem).
#' @param color String. The color name of the Checkbox. Leave empty for the 'teal lighten-1' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @examples
#' require(materializer)
#' material_like(
#'   inputId = "example_checkbox",
#'   color = 'teal lighten-1'
#' )
#' @export
material_like <- function(inputId, liked = TRUE, size = "medium", color = NULL) {

  if (is.null(color)) color <- default_color

  shiny::tags$span(
    id = inputId,
    class = paste("materialize-like"),
    material_icon(
      ifelse(liked, "thumb_up", "thumb_down"),
      align = "center",
      size = size,
      color = color
    ),
    includeInHead(
      "materialize-like.js"
    )
  )
}


#' @rdname material_like
#' @param session Shiny default reactive domain.
#' @export
update_material_like <- function(inputId, liked = NULL, session = shiny::getDefaultReactiveDomain()) {
  session$sendInputMessage(
    inputId,
    cleanList(
      liked = liked
    )
  )
}
