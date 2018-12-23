#' Create a breadcrumb
#'
#' UI content can be insert in a container to organize items on a page.
#' @param inputId String. The input identifier used to access the value.
#' @param navlist navlist. The navigation list, should contain target and name elements and optional as icon.
#' @examples
#' require(materializer)
#' material_breadcrumb(
#'   inputId = "breadcrumb",
#'   navlist = list(page1 = list(target="!#", name="Page 1"))
#' )
#' @export
material_breadcrumb <- function(inputId, navlist) {
  shiny::tags$nav(
    id = inputId,
    shiny::div(
      class = "nav-wrapper",
      shiny::div(
        class = "col s12",
        lapply(navlist, function(li) {
          li <- as.list(li)
          shiny::tags$a(
            href = li['target'],
            class = "breadcrumb",
            if (!is.null(li[["icon"]])) {
              shiny::tags$i(
                class = "material-icons left",
                li[["icon"]]
              )
            },
            li['name']
          )
        })
      )
    )
  )
}
