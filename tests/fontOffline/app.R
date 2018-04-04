if (interactive()) {
  library(shiny)
  library(materializer)

  # Wrap materialize apps in material_page
  ui <- material_page(
    fontoffline = TRUE,
    title = "Basic Page",
    tags$h1("Page Content"),
    material_button("btn", icon = "add", color = "red", class = "floating")
  )

  server <- function(input, output) {

  }
  shinyApp(ui = ui, server = server)
}
