  library(shiny)
  library(materializer)

  # Wrap materialize apps in material_page
  ui <- material_body(
    title = "Basic Page",
    material_navbar(
      inputId = "example_navbar",
      #sidenav = FALSE,
      navlist = list(
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
    material_tab_content(
      inputId = "example_tab_1",
      h1("Tab 1 Content")
    ),
    material_tab_content(
      inputId = "example_tab_2",
      h1("Tab 2 Content")
    )
  )

  server <- function(input, output) {

  }
  shinyApp(ui = ui, server = server)
