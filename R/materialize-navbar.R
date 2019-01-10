#' The material Nav bar
#'
#' The material Nav bar UI Element
#' @param inputId String. The input identifier used to access the value.
#' @param navlist list. The nav bar element list. The list need to contain a 'target' element and in adition could contain 'name' (string), 'icon' (string), 'active' (logical) and content (tagList).
#' @param logo list. The nav bar logo element list. The list need to contain a 'target' element and in adition could contain 'name' (string), 'icon' (string) or any tagList elements.
#' @param logoPosition String. The logo position in the nav bar. Values should be "left", "right".
#' @param tabs material_tabs. A material tabs could be included in nav bar.
#' @param sidenav Logical. A sidebar should be created when collapsed?
#' @param bgcolor String. The color name for Navbar backgroud. Leave empty for 'white' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param color String. The color name for links and icons in Navbar. Leave empty for the 'teal lighten-1' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @examples
#' require(materializer)
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
material_navbar <- function(inputId, navlist, logo = NULL, logoPosition = "left", tabs = NULL, sidenav = TRUE, bgcolor = "white", color = NULL) {
  if (is.null(color)) color <- default_color
  colorhex   <- material_colormap(color)
  bgcolorhex <- material_colormap(bgcolor)

  shiny::div(
    class = "materialize-navbar",
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
              class = paste("brand-logo", logoPosition),
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
        if (sidenav) {
        shiny::tags$a(
          href = "#",
          "data-target" = inputId,
          class = "sidenav-trigger",
          shiny::tags$i(
            class = "material-icons",
            "menu"
          )
        )},
        shiny::tags$ul(
          class = paste(ifelse(logoPosition == "right", "left", "right"),
                        ifelse(sidenav, "hide-on-med-and-down", "hide-on-down")),
          lapply(navlist, function(li) {
            li <- as.list(li)
              shiny::tags$li(
                class = if (isTRUE(as.logical(li[["active"]]))) "active",
                if (!is.null(li[["content"]])) {
                  li[["content"]]
                } else {
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
                }
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
    if (sidenav) {
      shiny::tags$ul(
        id = inputId,
        class = "sidenav",
        lapply(navlist, function(li) {
          li <- as.list(li)
          shiny::tags$li(
            class = if (isTRUE(as.logical(li[["active"]]))) "active",
            if (!is.null(li[["content"]])) {
              li[["content"]]
            } else {
              shiny::tags$a(
                href = li[["target"]],
                class = li[["class"]],
                type = li[["input"]],
                "data-target" = li[["data-target"]],
                if (!is.null(li[["icon"]])) {
                  shiny::tags$i(
                    class = "material-icons left",
                    li[["icon"]]
                  )
                },
                li[["name"]]
              )
            }
          )
        })
      )
    },
    includeInHead(
      "materialize-navbar.js",
      style = paste0(
        '.materialize-page {
          height: ', 100 - 10, 'vmin !important;
        }
        .materialize-navbar a {
         color: ', colorhex, ' !important;
        }
        .materialize-navbar i {
         color: ', colorhex, ' !important;
        }
        .materialize-navbar nav {
          background-color: ', bgcolorhex, ';
        }
        .materialize-navbar nav ul li.active {
          background-color: rgba(', paste(hex2rgb(colorhex),collapse = ","),',0.3) !important;
        }
        .materialize-navbar nav a:hover {
          background-color: rgba(', paste(hex2rgb(colorhex),collapse = ","),',0.1) !important;
        }
        .materialize-navbar nav .dropdown-content li:hover {
          background-color: rgba(', paste(hex2rgb(colorhex),collapse = ","),',0.1) !important;
        }
        .materialize-navbar nav .dropdown-content li.active {
          background-color: rgba(', paste(hex2rgb(colorhex),collapse = ","),',0.3) !important;
        }
        .materialize-navbar .sidenav {
          background-color: ', bgcolorhex, ';
        }
        .materialize-navbar .sidenav li a:hover {
          background-color: rgba(', paste(hex2rgb(colorhex),collapse = ","),',0.1) !important;
        }
        .materialize-navbar .sidenav .dropdown-content li:hover {
          background-color: rgba(', paste(hex2rgb(colorhex),collapse = ","),',0.1) !important;
        }
        .materialize-navbar .sidenav .dropdown-content li.active {
          background-color: rgba(', paste(hex2rgb(colorhex),collapse = ","),',0.3) !important;
        }
        .materialize-navbar .sidenav li.active {
          background-color: rgba(', paste(hex2rgb(colorhex),collapse = ","),',0.3) !important;
        }'
      )
    )
  )
}
