#' Create a column to organize UI content
#'
#' UI content can be placed in columns to organize items on a page.
#' @param ... The UI elements to place in the column.
#' @param width Integer. The width of the column. The value should be between 1 and 12.
#' @param type Char. Type of column responsive. The value should be s (default), m or l.
#' @param offset Integer. The offset to the left of the column. The value should be between 0 and 11.
#' @examples
#' material_column(
#'   width = 4,
#'   shiny::h1("Column Content")
#' )
#' @export
material_column <- function(..., width = 6, type = "s", offset = NULL){

  shiny::div(
    class = paste(
      "col",
      paste0(type,width),
      ifDef(offset, paste0("offset-",type))
      ),
    ...
  )
}
