if (interactive()) {
  library(shiny)
  library(materializer)

  # Wrap materialize apps in material_page
  ui <- material_body(
    title = "Basic Page",
    material_page(
      inputId = "page",
      material_row(
        tags$h1("Page Content"),
        material_column(
          width = 6,
          material_fileserver(inputId = "example_filesever", label = "File", color = "yellow accent-4")
        ),
        material_column(
          width = 6,
          material_file(inputId = "example_file", label = "File", color = "yellow accent-4")
        )
      )
    )
  )

  server <- function(input, output, session) {

    observeFileserver("example_filesever",input, roots = c(wd = '.'), filetypes = c('', 'txt'), defaultPath = '', defaultRoot = 'wd')

  }
  shinyApp(ui = ui, server = server)
}
