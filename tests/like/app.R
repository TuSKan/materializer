#### LIBRARIES ####
library(shiny)
library(materializer)

color = "light-blue accent-4"
ui <-
  material_body(
    title = "Material Like",
    offline = FALSE,
    material_page(
      inputId = "page1",
      h2("Like"),
      hr(),
      material_row(
        material_column(
          width = 4,
          material_checkbox(inputId = "disabled", "Disabled", checked = FALSE, color = color),
          material_button(inputId = "push", label = NULL, icon = "touch_app", color = color, class = "btn-round btn-large")
        ),
        material_column(
          width = 8,
          material_like(inputId = "like", liked = NULL, size = "large", disabled = FALSE)
        )
      )
    )
  )

server <- function(input, output, session) {

  observeEvent(input$push, {
    update_material_like(
      inputId = "like",
      liked = c(TRUE, FALSE, NULL)[floor(runif(1,1,4))]
    )
  }, ignoreInit = T, ignoreNULL = T)

  observeEvent(input$disabled, {
    update_material_like(
      inputId = "like",
      disabled = input$disabled
    )
  }, ignoreInit = T, ignoreNULL = T)

}

shinyApp(ui = ui, server = server)
