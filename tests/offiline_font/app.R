if(interactive()){
  library(shiny)
  library(materializer)

  # Wrap materialize apps in material_page
  ui <- material_page(
    include_fonts = TRUE,
    title = "Basic Page",
    tags$h1("Page Content"),
    material_button("btn", icon = "add", color = "#f44336", class = "floating")
  )

  server <- function(input, output) {

  }
  shinyApp(ui = ui, server = server)
}
