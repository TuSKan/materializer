#' The material SideNav bar
#'
#' The material SideNav bar UI Element
#' @param inputId String. The input identifier used to access the value.
#' @param navlist list. The nav bar element list. The list need to contain a 'target' element and in adition could contain 'name' (string), 'icon' (string), 'active' (logical).
#' @param logo list. The nav bar logo element list. The list need to contain a 'target' element and in adition could contain 'name' (string), 'icon' (string) or any tagList elements.
#' @param fixed Logical Should the sidenav be fixed?
#' @param width Integer. The width size of the sizebar
#' @param bgcolor String. The color name for Sidenav backgroud. Leave empty for 'white' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param color String. The color name for links and icons in Sidenav Leave empty for the 'teal lighten-1' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#'
#' @examples
#' require(materializer)
#' material_sidenav(
#'   inputId = "example_navbar",
#'   navlist = list(
#'     c(target = "lisk_1.html", name = "One"),
#'     c(target = "lisk_2.html", name = "Two"),
#'     c(target = "lisk_3.html", name = "Three", icon = "cloud"),
#'     c(target = "lisk_4.html", icon = "alarm", active = TRUE)
#'   )
#' )
#' @export
material_sidenav <- function(inputId, navlist, logo = NULL, fixed = TRUE, width = 300,  bgcolor = "white", color = NULL) {
  if (is.null(color)) color <- default_color
  colorhex   <- material_colormap(color)
  bgcolorhex <- material_colormap(bgcolor)

  shiny::div(
    class = "materialize-sidenav",
    shiny::tags$ul(
      id = inputId,
      "data-width" = width,
      class = paste("sidenav", if (fixed) "sidenav-fixed"),
      # shiny::tags$a(
      #   href = "#!",
      #   "data-target" = inputId,
      #   style = "position: flex; padding: 16px 0 0 16px;",
      #   class = "sidenav-close",
      #   onclick = "M.Sidenav.getInstance(this.parentNode).isFixed = !M.Sidenav.getInstance(this.parentNode).isFixed;",
      #   shiny::tags$i(
      #     class = "material-icons",
      #     "menu"
      #   )
      #),
      if (!isEmpty(logo)) {
        shiny::tags$li(
          class = "logo",
          if ("shiny.tag" %in% class(logo)) {
            logo
          } else {
            logo <- as.list(logo)
            shiny::tags$a(
              href = logo[["target"]],
              class = paste("brand-logo"),
              if (!isEmpty(logo[["icon"]])) {
                shiny::tags$i(
                  class = "material-icons",
                  logo[["icon"]]
                )
              },
              logo[["name"]]
            )
          }
        )
      },
      lapply(navlist, function(li) {
        li <- as.list(li)
        if (!is.null(li[["collapsible"]])) {
          shiny::tags$li(
            class = "no-padding",
            shiny::tags$ul(
              class = paste("collapsible", li[["class"]]),
              shiny::tags$li(
                shiny::tags$a(
                  class = paste("collapsible-header", "waves-effect"),
                  if (!is.null(li[["icon"]])) {
                    shiny::tags$i(
                      class = "material-icons",
                      li[["icon"]]
                    )
                  },
                  li[["name"]]
                ),
                shiny::tags$div(
                  class = paste("collapsible-body", bgcolor),
                  shiny::tags$ul(
                    lapply(li[["collapsible"]], function(lisub) {
                      lisub <- as.list(lisub)
                      if (isEmpty(lisub)) {
                        shiny::tags$li(
                          class = "divider",
                          tabindex = "-1"
                        )
                      } else {
                        shiny::tags$li(
                          shiny::tags$a(
                            href = lisub[["target"]],
                            class = paste(lisub[["class"]], "waves-effect"),
                            if (!is.null(lisub[["icon"]])) {
                              shiny::tags$i(
                                class = "material-icons",
                                lisub[["icon"]]
                              )
                            },
                            lisub[["name"]]
                          )
                        )
                      }
                    })
                  )
                )
              )
            )
          )
        } else {
          shiny::tags$li(
            class = paste("bold",if (isTRUE(as.logical(li[["active"]]))) "active"),
            shiny::tags$a(
              href = li[["target"]],
              class = paste(li[["class"]], "waves-effect"),
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
        }
      })
    ),
    shiny::tags$a(
      href = "#!",
      "data-target" = inputId,
      #style = "position: flex; padding: 16px 0 0 16px;",
      class = paste("sidenav-trigger", "hide-on-large-only"),
      shiny::tags$i(
        class = "material-icons",
        "menu"
      )
    ),
    includeInHead(
      "materialize-sidenav.js",
      style = paste0(
        '.materialize-sidenav .sidenav {
          width: ', width ,'px;
        }
        header, main, footer {
              padding-left: 300px;
        }
        header, body, footer {
          padding-left: ', fixed*width ,'px;
        }
        @media only screen and (max-width : 992px) {
          header, main, footer {
            padding-left: 0;
          }
        }
        .materialize-sidenav a {
          color: ', colorhex, ' !important;
        }
        .materialize-sidenav i {
          color: ', colorhex, ' !important;
        }
        .materialize-sidenav .sidenav {
            background-color: ', bgcolorhex, ';
        }
        @media only screen and (max-width : 992px) {
          header, body, footer {
            padding-left: 0;
          }
        }
        .materialize-sidenav .sidenav li a:hover {
          background-color: rgba(', paste(hex2rgb(colorhex),collapse = ","),',0.1) !important;
        }
        .materialize-sidenav .sidenav .collapsible-header:hover {
          background-color: rgba(', paste(hex2rgb(colorhex),collapse = ","),',0.1) !important;
        }
        .materialize-sidenav .sidenav li.active {
           background-color: rgba(', paste(hex2rgb(colorhex),collapse = ","),',0.3) !important;
        }'
      )
    )
  )
}
