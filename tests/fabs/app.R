library(shiny)
library(materializer)

# Wrap materialize apps in material_page
ui <- material_body(
  title = "Basic Page",
  material_page(
    inputId = "page1",
    material_row(
      material_column(
        width = 4,
        material_tooltip(
          material_fab(
            inputId = "example_flt_top",
            icon = "menu",
            position = "top-right",
            hover = FALSE,
            actlist = list(
              c(target = "id1", icon = "mode_edit"),
              c(target = "id2", icon = "insert_chart"),
              c(target = "id3", icon = "attach_file"),
              c(target = "id4", icon = "publish"),
              c(target = "id5", icon = "format_quote")
            )
          ),
          tooltip = "Click to open",
          position = "top"
        )
      ),
      material_column(
        width = 4,
        material_tooltip(
          material_fab(
            inputId = "example_flt_card",
            icon = "add",
            color = "red",
            size = "small",
            direction = "bottom",
            position = "top-right",
            fixed = FALSE,
            actlist = list(
              c(target = "id1", icon = "mode_edit", color = "yellow accent-4", size = "small"),
              c(target = "id2", icon = "insert_chart", color = "lime accent-4", size = "small"),
              c(target = "id3", icon = "attach_file", color = "green lighten-3", size = "small"),
              c(target = "id4", icon = "publish", color = "cyan accent-2", size = "small"),
              c(target = "id5", icon = "format_quote", color = "light-blue lighten-4", size = "small")
            )
          ),
          tooltip = "Hoverable",
          position = "top"
        )
      )
    )
  )
)

server <- function(input, output, session) {

}

shinyApp(ui = ui, server = server)
