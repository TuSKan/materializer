  library(shiny)
  library(materializer)

  # Wrap materialize apps in material_page
  ui <- material_body(
    title = "Basic Page",
    material_navbar(
      inputId = "example_navbar",
      navlist = list(
        c(target = "#page_teal", name = "Teal"),
        c(target = "#page_orange", name = "Orange"),
        c(target = "#page_green", name = "Green", icon = "cloud"),
        c(target = "#", icon = "alarm")
      ),
      #logo = c(target = "index.html", name = "Logo", icon = "accessibility"),
      logo = shiny::tags$object(
        type = "image/svg+xml",
        data = "http://next.materializecss.com/res/materialize.svg",
        "Your browser does not support SVG"
      ),
      color = "red",
      bgcolor = "red lighten-5"
    ),
    material_page(
      inputId = "page_teal",
      h1("Page Content Teal"),
      color = "teal"
    ),
    material_page(
      inputId = "page_orange",
      h1("Page Content Orange"),
      color = "deep-orange"
    ),
    material_page(
      inputId = "page_green",
      h1("Page Content Green"),
      color = "green"
    )
  )

  server <- function(input, output) {

  }

  shinyApp(ui = ui, server = server)
