if (interactive()) {
  library(shiny)
  library(materializer)

  # Wrap materialize apps in material_page
  ui <- material_body(
    title = "Basic Page",
    material_page(
      inputId = "page",
      tags$h1("Page Content"),
      material_switch(
        inputId = "switch",
        off = "Desktop",
        on = "Server",
        init = TRUE,
        color = "yellow accent-4"
      ),
      conditionalPanel(
        "input.switch == false",
        material_file(
          inputId = "desktop",
          label = "File",
          color = "yellow accent-4",
          icon = 'file_upload'
        )
      ),
      conditionalPanel(
        "input.switch == true",
        material_file(
          inputId = "server",
          label = "File",
          server = TRUE,
          color = "yellow accent-4",
          icon = 'file_upload'
        )
      )
    )
  )

  server <- function(input, output, session) {

    update_material_file(input, 'server', Sys.getenv("HOME"), session)

    observeEvent(input$server, {
      showNotification(input$server$path)
    },ignoreInit = TRUE)


    observeEvent(input$desktop, {
      showNotification(input$desktop$datapath)
    },ignoreInit = TRUE)


  }
  shinyApp(ui = ui, server = server)
}
