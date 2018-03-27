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

# if (interactive()) {
#   library(shiny)
#   library(shinymaterial)
#
#   ui <-
#     material_page(
#       material_row(
#         material_column(
#           width = 12,
#           material_file_input(
#             input_id = "file_1",
#             label = "file"
#           )
#         )
#       ),
#       material_row(
#         material_column(
#           width = 12,
#           tableOutput("contents")
#         )
#       )
#     )
#
#   server <- function(input, output) {
#     output$contents <- renderTable({
#       # input$file_1 will be NULL initially. After the user selects
#       # and uploads a file, it will be a data frame with 'name',
#       # 'size', 'type', and 'datapath' columns. The 'datapath'
#       # column will contain the local filenames where the data can
#       # be found.
#       in_file <- input$file_1
#
#       if (is.null(in_file))
#         return(NULL)
#
#       browser()
#       read.csv(in_file$datapath)
#     })
#   }
#
#   shinyApp(ui, server)
#
# }
