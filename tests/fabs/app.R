if (interactive()) {
  library(shiny)
  library(materializer)

  # Wrap materialize apps in material_page
  ui <- material_page(
    title = "Basic Page",
    material_container(
      material_row(
        material_column(
          width = 4,
          material_tooltip(
            material_fab(
              inputId = "example_flt_top",
              icon = "menu",
              position = "top-right",
              hover = FALSE,
              action = list(
                target = c("id1", "id2", "id3", "id4", "id5"),
                icon = c("mode_edit", "insert_chart", "attach_file", "publish", "format_quote")
              )
            ),
            tooltip = "Click to open",
            position = "top"
          )
        ),
        material_column(
          width = 4,
          material_card(
            title = "Floating in a card",
            material_tooltip(
              material_fab(
                inputId = "example_flt_card",
                icon = "add",
                color = "red",
                size = "small",
                direction = "bottom",
                position = "top-right",
                fixed = FALSE,
                action = list(
                  target = c("id1", "id2", "id3", "id4", "id5"),
                  icon = c("mode_edit", "insert_chart", "attach_file", "publish", "format_quote"),
                  color = c("yellow accent-4", "lime accent-4", "green lighten-3", "cyan accent-2", "light-blue lighten-4"),
                  size = "small"
                )
              ),
              tooltip = "Hoverable",
              position = "top"
            ),
            br(),br(),br(),br(),br(),br(),br(),br(),
            footer =
              material_fab(
                inputId = "example_flt_bottom",
                icon = "add",
                color = "blue",
                direction = "top",
                size = "medium",
                action = list(
                  target = c("id1", "id2", "id3", "id4", "id5"),
                  icon = c("mode_edit", "insert_chart", "attach_file", "publish", "format_quote")
                )
              )
          )
        )
      )
    )
  )

  server <- function(input, output, session) {

  }
  shinyApp(ui = ui, server = server)
}
