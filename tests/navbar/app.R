if (interactive()) {
  library(shiny)
  library(materializer)

  # Wrap materialize apps in material_page
  ui <- material_body(
    title = "Basic Page",
    material_navbar(
      inputId = "example_navbar",
      #sidenav = FALSE,
      navlist = list(
        c(target = "#", icon = "cloud", name = "Cloud"),
        c(target = "#", icon = "archive", class = "waves-effect waves-light btn red lighten-5 round", type = "button", name = "Download"),
        c(target = "#example_tab_1", name = "DropMe 1!", icon = "arrow_drop_down", class = "dropdown-trigger", "data-target" = "dropnav1"),
        c(target = "#example_tab_2", name = "DropMe 2!", icon = "arrow_drop_down", class = "dropdown-trigger", "data-target" = "dropnav2")
      ),
      #logo = c(target = "index.html", name = "Logo", icon = "accessibility"),
      logo = shiny::tags$object(
        type = "image/svg+xml",
        data = "http://next.materializecss.com/res/materialize.svg",
        "Your browser does not support SVG"
      ),
      tabs = material_tabs(
        inputId = "tabs_page",
        tabs = c(
          "Example Tab 1" = "example_tab_1",
          "Example Tab 2" = "example_tab_2"
        ),
        color = "red"
      ),
      sidenav = FALSE,
      color = "red",
      bgcolor = "red lighten-5"
    ),
    material_dropdown(
      inputId = "dropnav1",
      button = NULL,
      ddlist = list(
        c(target = "#page_teal", name = "Teal"),
        c(target = "#page_orange", name = "Orange"),
        c(target = "#page_green", name = "Green", icon = "cloud"),
        c(target = "#", icon = "alarm")
      ),
      color = "red",
      bgcolor = "red lighten-5"
    ),
    material_dropdown(
      inputId = "dropnav2",
      button = NULL,
      ddlist = list(
        c(target = "#page_teal", name = "Teal"),
        c(target = "#page_orange", name = "Orange"),
        c(target = "#page_green", name = "Green", icon = "cloud"),
        c(target = "#", icon = "alarm")
      ),
      color = "red",
      bgcolor = "red lighten-5"
    ),
    material_tab_content(
      inputId = "example_tab_1",
      material_page(
        inputId = "page_teal",
        h1("Page Content Teal"),
        color = "teal"
      ),
      material_page(
        inputId = "page_orange",
        h1("Page Content Orange"),
        color = "deep-orange"
      )
    ),
    material_tab_content(
      inputId = "example_tab_2",
      material_page(
        inputId = "page_green",
        h1("Page Content Green"),
        color = "green"
      )
    )
  )

  server <- function(input, output) {

  }
  shinyApp(ui = ui, server = server)
}
