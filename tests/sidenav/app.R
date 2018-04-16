if (interactive()) {
  library(shiny)
  library(materializer)

  # Wrap materialize apps in material_page
  ui <- material_body(
    title = "Basic Page",
    material_sidenav(
      inputId = "example_navbar",
      navlist = list(
        c(target = "#page_teal", name = "Teal"),
        c(target = "#page_orange", name = "Orange"),
        c(target = "#page_green", name = "Green", icon = "cloud"),
        c(target = "#", icon = "alarm"),
        c(target = "#", icon = "archive", class = "waves-effect waves-light btn transparent round", name = "Download"),
        list(
          name = "Collapsible", icon = "add_box", class = "accordion",
          collapsible = list(
            c(target = "#page_teal", name = "Teal"),
            c(target = "#page_orange", name = "Orange"),
            c(target = "#page_green", name = "Green", icon = "cloud"),
            c(target = "#", icon = "alarm")
          )
        ),
        list(
          name = "Collapsible Popout", icon = "apps", class = "popout",
          collapsible = list(
            c(target = "#page_teal", name = "Teal"),
            c(target = "#page_orange", name = "Orange"),
            c(target = "#page_green", name = "Green", icon = "cloud"),
            c(target = "lisk_4.html", icon = "alarm")
          )
        ),
        list(
          name = "Collapsible Expandable", icon = "apps", class = "expandable",
          collapsible = list(
            c(target = "#page_teal", name = "Teal"),
            c(target = "#page_orange", name = "Orange"),
            c(target = "#page_green", name = "Green", icon = "cloud"),
            c(target = "lisk_4.html", icon = "alarm")
          )
        )
      ),
      # logo = c(target = "index.html", name = "Logo", icon = "accessibility"),
      logo = shiny::tags$a(
        class = "brand-logo",
        style = "text-align: center; margin-bottom: 25px;",
        shiny::tags$object(
          type = "image/svg+xml",
          data = "http://next.materializecss.com/res/materialize.svg",
          "Your browser does not support SVG"
        )
      ),
      width = 280,
      # fixed = T,
      color = "deep-orange darken-4",
      bgcolor = "deep-orange lighten-5"
    ),
    material_page(
      inputId = "page_teal",
      material_collapsible(
        "ex_collapse",
        list(
          c(name = "First", icon = "cloud", content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
          c(name = "Second", icon = "place", content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
          c(name = "Third", icon = "whatshot", content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
        ),
        headercolor = "teal lighten-5"
      )
    ),
    material_page(
      inputId = "page_orange",
      material_collapsible(
        "ex_collapse_2",
        list(
          c(name = "First", icon = "cloud", content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
          c(name = "Second", icon = "place", content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
          c(name = "Third", icon = "whatshot", content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
        ),
        class = "expandable",
        color = "deep-orange darken-4",
        headercolor = "deep-orange lighten-5"
      )
    ),
    material_page(
      inputId = "page_green",
      material_collapsible(
        "ex_collapse_3",
        list(
          c(name = "First", icon = "cloud", content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
          c(name = "Second", icon = "place", content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
          c(name = "Third", icon = "whatshot", content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
        ),
        class = "popout",
        color = "light-green",
        headercolor = "light-green lighten-5"
      )
    )
  )

  server <- function(input, output) {

  }
  shinyApp(ui = ui, server = server)
}
