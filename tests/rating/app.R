#### LIBRARIES ####
library(shiny)
library(materializer)

color = "light-blue accent-4"
color2 = "deep-orange darken-3"
ui <-
  material_body(
    title = "Material Rating",
    offline = FALSE,
    material_page(
      inputId = "page1",
      h2("Rating Star System"),
      hr(),
      material_row(
        material_column(
          width = 4,
            material_button(inputId = "add", label = NULL, icon = "exposure_plus_1", color = color, class = "btn-round btn-large"),
            material_button(inputId = "minus", label = NULL, icon = "exposure_neg_1", color = color, class = "btn-round btn-large"),
            material_checkbox(inputId = "disabled", label = "disabled", checked = TRUE, color = color)
          ),
        material_column(
          width = 8,
          material_rating(inputId = "stars", n = 5, checked = 3.5, size = "3em", space = "0.1em", color = color, disabled = FALSE)
        ),
        material_column(
          width = 8, offset = 4,
          material_rating(inputId = "stars2", n = 5, checked = 3, size = "5em", space = "1em", color = color2, disabled = TRUE)
        )
      )
    )
  )

server <- function(input, output, session) {

  observeEvent(input$add, {
    update_material_rating(
      inputId = "stars",
      checked = as.numeric(input$stars) + 0.5
    )
  }, ignoreInit = T, ignoreNULL = T)

  observeEvent(input$minus, {
    update_material_rating(
      inputId = "stars",
      checked = as.numeric(input$stars) - 0.5
    )
  }, ignoreInit = T, ignoreNULL = T)

  observeEvent(input$disabled, {
    update_material_rating(
      inputId = "stars",
      disabled = input$disabled
    )
  }, ignoreInit = T, ignoreNULL = T)

}

shinyApp(ui = ui, server = server)
