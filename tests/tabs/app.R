if (interactive()) {
  library(shiny)
  library(materializer)

  ui <-
    material_page(
      title = "Testing",
      background_color = "white",
      material_row(
        material_tabs(
          inputId = "tabs_page",
          tabs = c("Example Tab 1" = "example_tab_1",
                   "Example Tab 2" = "example_tab_2"),
          material_tab_content(
            inputId = "example_tab_1",
            material_container(
              material_row(
                material_column(
                  width = 4,
                  material_card(
                    title = "Example Card",
                    shiny::tags$h5("Card Content"),
                    tabs = material_tabs(
                      inputId = "tabs_card_1",
                      tabs = c("Example Tab 11" = "example_tab_11",
                               "Example Tab 12" = "example_tab_12"),
                      incard = TRUE,
                      material_tab_content(inputId = "example_tab_11",
                                           h1("Example Tab 11")),
                      material_tab_content(inputId = "example_tab_12",
                                           h1("Example Tab 12"))
                    )
                  )
                )
              )
            )
          ),
          material_tab_content(
            inputId = "example_tab_2",
            material_container(
              material_row(
                material_column(
                  width = 6,
                  material_card(
                    title = "Example Card",
                    shiny::tags$h5("Card Content"),
                    background_color = "#4db6ac",
                    tabs = material_tabs(
                      inputId = "tabs_card_2",
                      tabs = c("Example Tab 21" = "example_tab_21",
                               "Example Tab 22" = "example_tab_22",
                               "Example Tab 23" = "example_tab_23"),
                      incard = TRUE,
                      background_color = "#e0f2f1",
                      material_tab_content(
                        inputId = "example_tab_21",
                        h1("Example Tab 21")),
                      material_tab_content(
                        inputId = "example_tab_22",
                        h1("Example Tab 22")),
                      material_tab_content(
                        inputId = "example_tab_23",
                        h1("Example Tab 23")
                      )
                    )
                  )
                )
              )
            )
          )
        ),
        material_button(
          inputId = "btn_page",
          label = "Next page"
        ),
        material_button(
          inputId = "btn_card1",
          label = "Next 1 tab"
        ),
        material_button(
          inputId = "btn_card2",
          label = "Next 2 tab"
        )
      )
    )



  server <- function(input, output, session) {

    observeEvent(input$btn_page, {
      update_material_tabs(
        inputId = "tabs_page",
        active = paste0("example_tab_", (as.integer(gsub("[^0-9]+","",input$tabs_page)) %% 2) + 1)
      )
    }, ignoreInit = TRUE)
    observeEvent(input$btn_card1, {
      update_material_tabs(
        inputId = "tabs_card_1",
        active = paste0("example_tab_1", ((as.integer(gsub("[^0-9]+","",input$tabs_card_1)) - 10) %% 2) + 1)
      )
    }, ignoreInit = TRUE)
    observeEvent(input$btn_card2, {
      update_material_tabs(
        inputId = "tabs_card_2",
        active = paste0("example_tab_2", ((as.integer(gsub("[^0-9]+","",input$tabs_card_2)) - 20) %% 3) + 1)
      )
    }, ignoreInit = TRUE)
  }

  # Run the application
  shinyApp(ui = ui, server = server)
}
