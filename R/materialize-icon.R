
#' Material Icon
#'
#' Createa material Icon element
#' @param icon String. The name of the icon. Leave empty for no icon. Visit \url{http://materializecss.com/icons.html} for a list of available icons.
#' @param align String The icon align. Values should be 'left', 'right', and 'center'
#' @param size String. Size of icon, could be 'tiny' (1rem), 'small' (2rem), 'medium' (4rem) and 'large' (6rem).
#' @param class String. Aditional class to icon
#' @param color String. The color name for links and icons in Sidenav Leave empty for the 'teal lighten-1' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param ... tagList. Any additional tag list
#' @examples
#' require(materializer)
#' material_icon(icon = "cloud")
#' @export
material_icon <- function(icon, align = NULL, size = NULL, class = NULL, color = NULL, ...) {
  if (!is.null(align)) {
    if (align == "center")
      align = NULL
  }

  shiny::tags$i(
    class = paste("material-icons", align, size, class, colortext(color)),
    ...,
    icon
  )
}

