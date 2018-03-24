if (interactive()) {
  library(shiny)
  library(shinymaterial)

  # Wrap shinymaterial apps in material_page
  ui <- material_page(
    title = "Basic Page",
    include_fonts = TRUE,
    tags$h1("Page Content"),
    material_slider(
      inputId = "s2",
      label = "S2",
      color = "#ff6f00"
    ),
    uiOutput('ui_test')
  )

  server <- function(input, output) {

    rv <- reactiveVal()

    output$ui_test <- renderUI({
      material_row(
        material_column(
          width = 4,
          material_slider(
            inputId = "s1",
            label = "S1",
            color = "#dd2c00"
          )
        )
      )
    })

    observe({
      message(input$s1)
      message(input$s2)
      rv <- input$s1
    })

  }
  shinyApp(ui = ui, server = server)
}
