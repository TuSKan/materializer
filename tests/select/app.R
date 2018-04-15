if (interactive()) {
  library(shiny)
  library(materializer)

  # Wrap materialize apps in material_page
  ui <- material_body(
    title = "Basic Page",
    material_container(
      material_row(
        h1("Page Content"),
        br(),br(),
        material_column(
          width = 6,
          material_select(
            inputId = "sel",
            label = "Choose:",
            choices = c(one = "One", two = "Two", three = "Three"),
            selected = "three",
            color = "deep-orange darken-4"
          )
        ),
        material_column(
          width = 6,
          material_dropdown(
            inputId = "drop",
            button = material_button(
              inputId = "btnDrop",
              label = 'Drop Menu',
              icon = "arrow_drop_down",
              class = "round",
              color = "deep-orange darken-4"
            ),
            ddlist = list(
              c(target = "tgt_1", name = "One"),
              c(target = "tgt_2", name = "Two"),
              NULL,
              c(target = "tgt_3", name = "Three", icon = "cloud"),
              c(target = "tgt_4", icon = "alarm")
            ),
            color = "deep-orange darken-4"
          )
        ),
        br(),br(),br(),br(),br(),
        br(),br(),br(),br(),br()
      )
    )
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
