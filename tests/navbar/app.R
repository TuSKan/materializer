if (interactive()) {
  library(shiny)
  library(materializer)

  # Wrap materialize apps in material_page
  ui <- material_page(
    title = "Basic Page",
    material_navbar(
      inputId = "example_navbar",
      #sidenav = FALSE,
      navlist = list(
        c(target = "lisk_1.html", name = "One"),
        c(target = "lisk_2.html", name = "Two"),
        c(target = "lisk_3.html", name = "Three", icon = "cloud"),
        c(target = "lisk_4.html", icon = "alarm", active = TRUE),
        c(target = "lisk_5.html", icon = "archive", class = "waves-effect waves-light btn red lighten-5 round", type = "button"),
        c(target = "#!", name = "DropMe!", icon = "arrow_drop_down", class = "dropdown-trigger", "data-target" = "dropnav")
      ),
      #logo = c(target = "index.html", name = "Logo", icon = "accessibility"),
      logo = shiny::tags$object(
        type = "image/svg+xml",
        data = "http://next.materializecss.com/res/materialize.svg",
        "Your browser does not support SVG"
      ),
      tabs = material_tabs(
        inputId = "tabs_page",
        tabs = c(
          "Example Tab 1" = "example_tab_1",
          "Example Tab 2" = "example_tab_2"
        ),
        color = "red"
      ),
      sidenav = FALSE,
      color = "red",
      bgcolor = "red lighten-5"
    ),
    material_dropdown(
      inputId = "dropnav",
      button = NULL,
      ddlist = list(
        c(target = "lisk_1.html", name = "One"),
        c(target = "lisk_2.html", name = "Two"),
        NULL,
        c(target = "lisk_3.html", name = "Three", icon = "cloud"),
        c(target = "lisk_4.html", icon = "alarm")
      ),
      color = "red",
      bgcolor = "red lighten-5"
    ),
    material_container(
      material_row(
        material_tab_content(
          inputId = "example_tab_1",
          h3("Content 1")
        ),
        material_tab_content(
          inputId = "example_tab_2",
          h3("Content 2")
        )
      )
    )
  )

  server <- function(input, output) {

  }
  shinyApp(ui = ui, server = server)
}
