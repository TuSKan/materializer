#### LIBRARIES ####
library(shiny)
library(materializer)

color = "light-blue accent-4"
ui <-
  material_body(
    title = "Material Tags",
    offline = FALSE,
    material_page(
      inputId = "page1",
      h2("Tags"),
      material_row(
        material_column(
          width = 4,
          material_row(
            material_column(
              width = 12,
              material_text(inputId = "tags_add", label = "Enter Tags", inline = TRUE, color = color),
              material_button(inputId = "tags_add_btn", icon = "add", class = "btn-round", color = color)
            ),
            material_column(
              width = 12,
              material_text(inputId = "tags_del", label = "Delete Tags", inline = TRUE, color = color),
              material_button(inputId = "tags_del_btn", icon = "clear", class = "btn-round", color = color)
            )
          )
        ),
        material_column(
          width = 8,
          material_tags(
            inputId = "tags",
            readonly = FALSE,
            tags = list(c(tag = "Apple"),
                        c(tag = "Amazon"),
                        c(tag = "Google")),
            color = color)
        )
      ),
      material_row(
        material_column(
          width = 4,
          material_row(
            material_column(
              width = 12,
              material_text(inputId = "tags2_add", label = "Enter Tags", inline = TRUE, color = color),
              material_button(inputId = "tags2_add_btn", icon = "add", class = "btn-round", color = color)
            ),
            material_column(
              width = 12,
              material_text(inputId = "tags2_del", label = "Delete Tags", inline = TRUE, color = color),
              material_button(inputId = "tags2_del_btn", icon = "clear", class = "btn-round", color = color)
            )
          )
        ),
        material_column(
          width = 8,
          material_tags(
            inputId = "tags2",
            readonly = FALSE,
            tags = list(c(tag = "Apple"),
                        c(tag = "Amazon"),
                        c(tag = "Google")),
            color = color)
        )
      )
    )
  )

server <- function(input, output, session) {

  observeEvent(input$tags_add_btn, {
    update_material_tags(
      inputId = "tags",
      addtags = list(tag = input$tags_add)
    )
  }, ignoreInit = T, ignoreNULL = T)

  observeEvent(input$tags_del_btn, {
    update_material_tags(
      inputId = "tags",
      deltags = input$tags_del
    )
  }, ignoreInit = T, ignoreNULL = T)

  observeEvent(input$tags2_add_btn, {
    update_material_tags(
      inputId = "tags2",
      addtags = list(tag = input$tags2_add)
    )
  }, ignoreInit = T, ignoreNULL = T)

  observeEvent(input$tags2_del_btn, {
    update_material_tags(
      inputId = "tags2",
      deltags = input$tags2_del
    )
  }, ignoreInit = T, ignoreNULL = T)

}

shinyApp(ui = ui, server = server)
