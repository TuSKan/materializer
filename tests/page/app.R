#### LIBRARIES ####
library(shiny)
library(materializer)

ui <-
  material_body(
      title = "Page Test",
      offline = FALSE,
      #### Breadcrumbs ####
      material_navbar(
        inputId = "navbar",
        bgcolor = 'teal lighten-1',
        color = NA,
        logo = "home",
        navlist = list(
          c(name = "page1",  target = "#page1"),
          c(name = "page2",  target = "#page2")
        )
      ),
      #### INIT ####
      material_page(
        inputId = "page1",
        h2("Page 1"),
        material_button("goto2", "GoTo Page 2", "arrow_forward")
      ),
      material_page(
        inputId = "page2",
        h2("Page 2"),
        material_button("goto1", "GoTo Page 1", "arrow_forward")
      )
  )

server <- function(input, output, session) {

  observeEvent(input$goto1, {
    update_material_page(
      "page1",
      active = TRUE
    )
  }, ignoreInit = T, ignoreNULL = T)

  observeEvent(input$goto2, {
    update_material_page(
      "page2",
      active = TRUE
    )
  }, ignoreInit = T, ignoreNULL = T)

}

shinyApp(ui = ui, server = server)
