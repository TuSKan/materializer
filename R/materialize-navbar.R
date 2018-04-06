#' The material Nav bar
#'
#' The material Nav bar UI Element
#' @param inputId String. The input identifier used to access the value.
#' @param navlist list. The nav bar element list. The list need to contain a 'target' element and in adition could contain 'name' (string), 'icon' (string), 'active' (logical).
#' @param logo list. The nav bar logo element list. The list need to contain a 'target' element and in adition could contain 'name' (string), 'icon' (string) or any tagList elements.
#' @param position String. The position of the nav bar. Values should be "left", "right".
#' @param tabs material_tabs. A material tabs could be included in nav bar.
#' @param fixed Logical, Should the nav bar be fixed?
#' @param color String. The color name of the Checkbox. Leave empty for the 'teal lighten-1' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @examples
#' material_navbar(
#'   inputId = "example_navbar",
#'   navlist = list(
#'     c(target = "lisk_1.html", name = "One"),
#'     c(target = "lisk_2.html", name = "Two"),
#'     c(target = "lisk_3.html", name = "Three", icon = "cloud"),
#'     c(target = "lisk_4.html", icon = "alarm", active = TRUE)
#'   ),
#'   logo = c(target = "index.html", name = "Logo", icon = "accessibility"),
#' )
#' @export
material_navbar <- function(inputId, navlist, logo = NULL, position = "right", tabs = NULL, fixed = FALSE, color = NULL) {

  if (is.null(color)) color <- default_color
  colorhex <- material_colormap(color)

  shiny::div(
    class = paste("materialize-navbar", if (fixed) "navbar-fixed"),
    shiny::tags$nav(
      class = if (!is.null(tabs)) "nav-extended",
      shiny::div(
        class = "nav-wrapper",
        if (!isEmpty(logo)) {
          if ("shiny.tag" %in% class(logo)) {
            logo
          } else {
            logo <- as.list(logo)
            shiny::tags$a(
              href = logo[["target"]],
              class = paste("brand-logo", ifelse(position == "right", "left", "right")),
              if (!isEmpty(logo[["icon"]])) {
                shiny::tags$i(
                  class = "material-icons",
                  logo[["icon"]]
                )
              },
              logo[["name"]]
            )
          }
        },
        shiny::tags$a(
          href = "#",
          "data-target" = inputId,
          class = "sidenav-trigger",
          shiny::tags$i(
            class = "material-icons",
            "menu"
          )
        ),
        shiny::tags$ul(
          class = paste(position, "hide-on-med-and-down"),
          lapply(navlist, function(li) {
            li <- as.list(li)
            shiny::tags$li(
              class = if (isTRUE(as.logical(li[["active"]]))) "active",
              shiny::tags$a(
                href = li[["target"]],
                class = li[["class"]],
                "data-target" = li[["data-target"]],
                if (!is.null(li[["icon"]])) {
                  shiny::tags$i(
                    class = "material-icons left",
                    li[["icon"]]
                  )
                },
                li[["name"]]
              )
            )
          })
        )
      ),
      if (!isEmpty(tabs)) {
        shiny::div(
          class = "nav-content",
          tabs
        )
      }
    ),
    shiny::tags$ul(
      id = inputId,
      class = "sidenav",
      lapply(navlist, function(li) {
        li <- as.list(li)
        shiny::tags$li(
          class = if (isTRUE(as.logical(li[["active"]]))) "active",
          shiny::tags$a(
            href = li[["target"]],
            class = li[["class"]],
            "data-target" = li[["data-target"]],
            if (!is.null(li[["icon"]])) {
              shiny::tags$i(
                class = "material-icons left",
                li[["icon"]]
              )
            },
            li[["name"]]
          )
        )
      })
    ),
    includeInHead(
      "materialize-navbar.js",
      style = paste0(
        '.materialize-navbar nav {
          background-color: ', colorhex, ' ;
        }'
      )
    )
  )
}



