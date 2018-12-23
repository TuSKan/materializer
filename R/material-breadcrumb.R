#' Create a breadcrumb
#'
#' UI content can be insert in a container to organize items on a page.
#' @param inputId String. The input identifier used to access the value.
#' @param navlist navlist. The navigation list, should contain href and title elements
#' @examples
#' require(materializer)
#' material_breadcrumb(inputId = "breadcrumb", navlist = list(page1 = list(href="!#", title="Page 1")))
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
            href = li['href'],
            class = "breadcrumb",
            li['title']
          )
        })
      )
    )
  )
}
