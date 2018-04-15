if (interactive()) {
  library(shiny)
  library(materializer)

  isEmpty <- function(x) ifelse(length(x) == 0 || x == "" || is.na(x), TRUE, FALSE)
  empty2NA <- function(x) ifelse(isEmpty(x), NA, x)

  ui <- material_body(
    title = "Basic Page",
    include_fonts = TRUE,
    tags$h1("Page Content"),
    material_row(
      material_column(
        width = 4,
        material_text(inputId = "textInput", label = "Text", color = "yellow accent-4")
      ),
      material_column(
        width = 4,
        material_number(inputId = "numbInput", label = "Number", color = "yellow accent-4")
      ),
      material_column(
        width = 4,
        material_password(inputId = "passInput", label = "Password", color = "yellow accent-4")
      ),
      material_column(
        width = 4,
        material_email(inputId = "emailInput", label = "Email", color = "yellow accent-4")
      ),
      material_column(
        width = 4,
        material_date(inputId = "dateInput", label = "Date", color = "yellow accent-4")
      ),
      material_column(
        width = 4,
        material_time(inputId = "timeInput", label = "time", color = "yellow accent-4")
      ),
      material_column(
        width = 4,
        material_button(inputId = "btnSet", label = "SetValue", color = "yellow accent-4")
      ),
      material_column(
        width = 8,
        tableOutput(outputId = "table")
      )
    )
  )

  server <- function(input, output, session) {

    observeEvent(input$btnSet, {
      if (!isEmpty(input$textInput)) update_material_text("textInput",value = paste0(input$textInput,"_txt"))
      if (!isEmpty(input$numbInput)) update_material_number("numbInput",value = (input$numbInput + input$numbInput))
      if (!isEmpty(input$passInput)) update_material_password("passInput",value = paste0(input$passInput,"#"))
      if (!isEmpty(input$emailInput)) update_material_email("emailInput",value = paste0(input$emailInput,"@"))
      if (!isEmpty(input$dateInput)) update_material_date("dateInput",value = strftime(as.Date(input$dateInput) + 360, format = "%Y-%m-%d"))
    }, ignoreInit = TRUE)

    output$table <- renderTable({
      data.frame(
        text = empty2NA(input$textInput),
        number = empty2NA(input$numbInput),
        password = empty2NA(input$passInput),
        email = empty2NA(input$emailInput),
        date = strftime(empty2NA(input$dateInput),format = "%Y-%m-%d"),
        time = empty2NA(input$timeInput)
      )
    })
  }
  shinyApp(ui = ui, server = server)
}
