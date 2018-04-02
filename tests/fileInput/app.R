if (interactive()) {
  library(shiny)
  library(materializer)

  # Wrap materialize apps in material_page
  ui <- material_page(
    title = "Basic Page",
    include_fonts = TRUE,
    tags$h1("Page Content"),
    material_file(inputId = "example_file_input", label = "ok", class = "round", color = "#ffd600")
  )

  server <- function(input, output, session) {

    observeEvent(input$example_file_input, {

      inFile <- input$example_file_input
      if (length(inFile) == 0) {
        return(NULL)
      }
      browser()
      x <- read.csv(inFile$datapath)
      message(head(x))
    },ignoreInit = TRUE)


  }
  shinyApp(ui = ui, server = server)
}
