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
          material_floating(
            inputId = "example_flt_top",
            icon = "menu",
            color = "#f44336",
            position = "top-right",
            hover = FALSE,
            action = list(
              target = c("id1", "id2", "id3", "id4", "id5"),
              icon = c("mode_edit", "insert_chart", "attach_file", "publish", "format_quote")
            )
          )
        ),
        material_column(
          width = 4,
          material_card(
            title = "Floating in a card",
            material_floating(
              inputId = "example_flt_card",
              icon = "add",
              color = "#4db6ac",
              size = "small",
              direction = "bottom",
              position = "top-right",
              fixed = FALSE,
              action = list(
                target = c("id1", "id2", "id3", "id4", "id5"),
                icon = c("mode_edit", "insert_chart", "attach_file", "publish", "format_quote"),
                color = c("#2196f3", "#ffd600", "#cddc39", "#4caf50", "#ff9800"),
                size = "small"
              )
            ),
            br(),br(),br(),br(),br(),br(),br(),br(),
            footer =
              material_floating(
                inputId = "example_flt_bottom",
                icon = "add",
                color = "#ffd600",
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
