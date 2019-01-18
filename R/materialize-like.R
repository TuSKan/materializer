#' Create a materialize like element
#'
#' Build a materialize like and dislike element
#' @param inputId String. The input identifier used to access the value.
#' @param liked Boolian. The initial status of the element. Could be TRUE, FALSE or NULL
#' @param size String. Size of icon, could be 'tiny' (1rem), 'small' (2rem), 'medium' (4rem) and 'large' (6rem).
#' @param disabled Boolean. Disable iteractivity (click).
#' @examples
#' require(materializer)
#' material_like(
#'   inputId = "example_checkbox",
#'   liked = TRUE
#' )
#' @export
material_like <- function(inputId, liked = NULL, size = "medium", disabled = FALSE) {

  shiny::tags$span(
    id = inputId,
    class = paste("materialize-like"),
    style = paste0("pointer-events:",ifelse(disabled,"none","auto")),
    material_icon(
      ifelse(is.null(liked),"thumbs_up_down",ifelse(liked, "thumb_up", "thumb_down")),
      align = "center",
      size = size,
      color = ifelse(is.null(liked),"grey lighten-2",ifelse(liked, "green lighten-2", "red lighten-2"))
    ),
    includeInHead(
      "materialize-like.js"
    )
  )
}


#' @rdname material_like
#' @param session Shiny default reactive domain.
#' @export
update_material_like <- function(inputId, liked = NULL, disabled = NULL, session = shiny::getDefaultReactiveDomain()) {
  session$sendInputMessage(
    inputId,
    cleanList(
      liked = liked,
      disabled = disabled
    )
  )
}
