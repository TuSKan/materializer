#' Create a column to organize UI content
#'
#' UI content can be placed in columns to organize items on a page.
#' @param ... The UI elements to place in the column.
#' @param width Integer. The width of the column. The value should be between 1 and 12.
#' @param type Char. Type of column responsive. The value should be s (default), m or l.
#' @param offset Integer. The offset to the left of the column. The value should be between 0 and 11.
#' @examples
#' require(materializer)
#' material_column(
#'   width = 4,
#'   shiny::h1("Column Content")
#' )
#' @export
material_column <- function(..., width = 6, type = "s", offset = NULL) {

  shiny::div(
    class = paste(
      "col",
      paste0(type,width),
      ifDef(offset, paste0("offset-",type))
      ),
    ...
  )
}


#' Create a row to organize UI content
#'
#' UI content can be placed in a row to organize items on a page.
#' @param ... The UI elements to place in the row.
#' @examples
#' require(materializer)
#' material_row(
#'   shiny::tags$h1("Row Content")
#' )
#' @export
material_row <- function(...){
  shiny::tags$div(
    class = "row",
    ...
  )
}


#' Create a section to organize UI content
#'
#' UI content can be insert in section to organize items on a page.
#' @param ... The UI elements to place in the column.
#' @param title Integer. The width of the column. The value should be between 1 and 12.
#' @examples
#' require(materializer)
#' material_section(
#'   title = "Section",
#'   shiny::h1("Content goes here")
#' )
#' @export
material_section <- function(..., title = NULL) {
  shiny::div(
    class = "section",
    if (!is.null(title)) shiny::tags$h5(title),
    ...
  )
}

#' Create a divider to organize UI content
#'
#' UI content can be divide to organize items on a page.
#' @examples
#' require(materializer)
#' material_divider()
#' @export
material_divider <- function(){
  shiny::div(
    class = "divider"
  )
}

#' Create a container to organize UI content
#'
#' UI content can be insert in a container to organize items on a page.
#' @param ... tagList. UI content list
#' @examples
#' require(materializer)
#' material_container()
#' @export
material_container <- function(...) {
  shiny::div(
    class = "container",
    ...
  )
}

#' Create a container to organize UI content
#'
#' UI content can be insert in a container to organize items on a page.
#' @param inputId String. The input identifier used to access the value.
#' @param ... tagList. UI content list
#' @param bgcolor String. The color name for Sidenav backgroud. Leave empty for 'transparent' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param color String. The color name for links and icons in Sidenav Leave empty for the 'teal lighten-1' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @examples
#' require(materializer)
#' material_page(inputId = "expage", shiny::h1("Page Content"))
#' @export
material_page <- function(inputId, ..., bgcolor = "transparent", color = NULL) {
  color = strsplit(trimws(color), " ")[[1]]
  shiny::div(
    id = inputId,
    class = paste(
      "materialize-page",
      "container",
      sub(" ", ".",trimws(bgcolor)),
      paste(ifDef(color[1], suffix = "-text"), ifDef(color[2], prefix = "text-"), collapse = ".")
    ),
    shiny::div(
      class = "section",
      ...
    )
  )
}

