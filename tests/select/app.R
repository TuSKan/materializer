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
            choices = c(one = "One", two = "Two", three = "Three", four = "Four"),
            selected = "three",
            color = "deep-orange darken-4"
          )
        ),
        material_column(
          width = 6,
          material_radio(
            inputId = "drop",
            choices = c(one = "One", two = "Two", three = "Three", four = "Four"),
            color = "deep-orange darken-4"
          )
        ),
        br(),br(),
        h3(
          style = "padding:20px 20px 20px 20px; text-align: center;",
          textOutput("selval")
        ),
        br(),br(),br(),br(),br(),
        br(),br(),br(),br(),br()
      )
    )
  )

  server <- function(input, output, session) {

    output$selval <- renderText({
      input$sel
    })

    observeEvent(input$drop, {
      update_material_select(
        "sel",
        selected = input$drop
      )
    })

  }
  shinyApp(ui = ui, server = server)
}
