
#' Material Image
#'
#' Createa material Image element
#' @param src String. The file path of the image
#' @param width String The width of the image in html metric. Could be 100px, auto, 100%
#' @param heigth String The heigth of the image in html metric. Could be 100px, auto, 100%
#' @param class String. Aditional class to image
#' @param caption String. The caption of the image
#' @param ... tagList. Any additional tag list
#' @examples
#' require(materializer)
#' material_img(src = "image.png", width = 50)
#' @export
material_img <- function(src, width = NULL, heigth = NULL, class = NULL, caption = NULL, ...) {
  shiny::tags$img(
    src = src,
    width = width,
    heigth = heigth,
    "data-caption" = caption,
    ...
  )
}
