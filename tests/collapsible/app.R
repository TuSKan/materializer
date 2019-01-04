#### LIBRARIES ####
library(shiny)
library(materializer)

ui <-
  material_body(
    title = "Add Itens on Collapsible",
    offline = FALSE,
    material_page(
      inputId = "page1",
      h2("Add Itens on Collapsible"),
      hr(),
      material_row(
        material_column(
          width = 2,
          material_button(inputId = "add", label = "Add", icon = "exposure_plus_1")
        ),
        material_column(
          width = 8,
          material_collapsible(inputId = "list", cllist = list())
        )
      )
    )
  )

server <- function(input, output, session) {

  cllist <- reactiveVal()

  observeEvent(input$add, {
    cllist(c(cllist(),list(list(name = paste("Sample text -", length(cllist())) , content = "empty"))))
    update_material_collapsible(
      inputId = "list",
      cllist = cllist()
    )
  }, ignoreInit = T, ignoreNULL = T)
}

shinyApp(ui = ui, server = server)
