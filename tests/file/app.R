if (interactive()) {
  library(shiny)
  library(materializer)

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
        color = "orange darken-2"
      ),
      conditionalPanel(
        "input.switch == false",
        material_file(
          inputId = "desktop",
          label = "File",
          color = "orange darken-2",
          icon = 'file_upload'
        )
      ),
      conditionalPanel(
        "input.switch == true",
        material_file(
          inputId = "server",
          label = "File",
          server = TRUE,
          color = "orange darken-2",
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
