if (interactive()) {
  library(shiny)
  library(shinymaterial)

  # Wrap shinymaterial apps in material_page
  ui <- material_page(
    title = "Basic Page", nav_bar_fixed = TRUE, include_fonts = TRUE,
    tags$h1("Page Content"),
    material_row(
      material_column(
        width = 4,
        material_button(inputId = "btn1", label = "Select", color = "#ffd600"),
        material_button(inputId = "btn2", label = "Choice", color = "#ffd600"),
        material_button(inputId = "btn3", label = "Label", color = "#ffd600"),
        material_button(inputId = "btn4", label = "Check", color = "#ffd600"),
        material_select(inputId = "sel1", label = "test",
                          choices = c("Choice 1" = 1,
                                      "Choice 2" = 2),
                        selected = 2,
                        color = "#ffd600"),
        material_checkbox(inputId = "chk1", label = "Checkbox", checked = TRUE, color = "#ffd600"),
        material_text(inputId = "txt1", label = "Label", color = "#ffd600")
      ),
      material_column(
        width = 8,
        plotOutput("myPlot")
      )
    )
  )

  server <- function(input, output, session) {

    output$myPlot <- renderPlot({
      plot(1:10)
    })

    observeEvent(input$btn1, {
      update_material_select(
        inputId = "sel1",
        selected = 2
      )
    }, ignoreInit = TRUE)

    observeEvent(input$btn2, {
      update_material_select(
        inputId = "sel1",
        choices = c("Choice 3" = 1,
                    "Choice 4" = 2)
      )
      update_material_text(
        inputId = "txt1",
        placeholder = "Pre-filled"
      )
    }, ignoreInit = TRUE)

    observeEvent(input$btn3, {
      update_material_select(
        inputId = "sel1",
        label = "Select"
      )
      update_material_checkbox(
        inputId = "chk1",
        label = paste("Checkbox", input$chk1,sep = "-")
      )
      update_material_text(
        inputId = "txt1",
        label = "Enter Text Here"
      )
    }, ignoreInit = TRUE)

    observeEvent(input$btn4, {
      update_material_checkbox(
        inputId = "chk1",
        checked = !input$chk1
      )
    }, ignoreInit = TRUE)

    observeEvent(input$chk1, {
      update_material_text(
        inputId = "txt1",
        readonly = input$chk1
      )
    }, ignoreInit = TRUE)

  }

  shinyApp(ui = ui, server = server)
}
