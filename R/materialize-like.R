#' Create a materialize like element
#'
#' Build a materialize like and dislike element
#' @param inputId String. The input identifier used to access the value.
#' @param liked Boolian. The initial status of the element
#' @param size String. Size of icon, could be 'tiny' (1rem), 'small' (2rem), 'medium' (4rem) and 'large' (6rem).
#' @param depth Integer. The amount of depth of the button. The value should be between 0 and 5. Leave empty for the default depth.
#' @param color String. The color name of the Checkbox. Leave empty for the 'teal lighten-1' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @examples
#' require(materializer)
#' material_like(
#'   inputId = "example_checkbox",
#'   color = 'teal lighten-1'
#' )
#' @export
material_like <- function(inputId, liked = TRUE, size = "medium", depth = FALSE, color = NULL) {

  if (is.null(color)) color <- default_color
  colornm <- css.names(color)
  colorhex <- material_colormap(color)

  shiny::tags$a(
    id = inputId,
    class = paste("materialize-like"),
    shiny::tags$i(
      class = paste("material-icons", size, paste0("icon-",colornm)),
      ifelse(liked, "thumb_up", "thumb_down")
    ),
    includeInHead(
      "materialize-like.js",
      style = paste0('.', paste0("icon-",colornm), ' {color: ', colorhex, ';}')
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
