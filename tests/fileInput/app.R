if (interactive()) {
  library(shiny)
  library(materializer)

  # Wrap materialize apps in material_page
  ui <- material_page(
    title = "Basic Page",
    tags$h1("Page Content"),
    material_file(inputId = "example_file_input", label = "ok", class = "round", color = "yellow accent-4")
  )

  server <- function(input, output, session) {

    observeEvent(input$example_file_input, {

      inFile <- input$example_file_input
      if (length(inFile) == 0) {
        return(NULL)
      }
      x <- read.csv(inFile$datapath)
      message(head(x))
    },ignoreInit = TRUE)


  }
  shinyApp(ui = ui, server = server)
}
