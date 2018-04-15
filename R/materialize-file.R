#' Create a materialize file input
#'
#' Build a materialize file input.
#' @param inputId String. The input identifier used to access the value.
#' @param label String. The file input button text.
#' @param multiple logical. Should select multiples files?
#' @param icon String. The name of the icon. Leave empty for no icon. Visit \url{http://materializecss.com/icons.html} for a list of available icons.
#' @param class String. Aditional class for button. Value should be round, floating, large and small.
#' @param depth Integer. The amount of depth of the button. The value should be between 0 and 5. Leave empty for the default depth.
#' @param color String. The color name of the fileinput. Leave empty for the 'teal lighten-1' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @examples
#' if (interactive()) {
#' library(shiny)
#' library(materializer)

#' # Wrap materialize apps in material_page
#' ui <- material_body(
#'   title = "Basic Page",
#'   include_fonts = TRUE,
#'   tags$h1("Page Content"),
#'   material_file(inputId = "example_file_input", label = "ok")
#' )
#'
#' server <- function(input, output, session) {
#'
#'   observeEvent(input$example_file_input, {
#'     inFile <- input$example_file_input
#'     if (is.null(inFile)) {
#'       return(NULL)
#'     }
#'     x <- read.csv(inFile$datapath)
#'     message(head(x))
#'   })
#' }
#' shinyApp(ui = ui, server = server)
#' }
#' @export
material_file <- function(inputId, label, multiple = FALSE, icon = NULL, class = NULL, depth = NULL, color = NULL) {
  if (is.null(color)) color <- default_color
  colornm <- css.names(color)
  colorhex <- material_colormap(color)

  shiny::div(
    class = "file-field input-field materialize-file",
    shiny::div(
      class = paste(
        "waves-effect waves-light btn",
        ifDef(class, "btn-"),
        ifDef(depth, "z-depth-"),
        ifDef(color)
      ),
      shiny::tags$span(
        label
      ),
      shiny::tags$input(
        id = inputId,
        type = "file",
        multiple = if (multiple) NA,
        class = "materialize-file-input"
      )
    ),
    shiny::div(
      class = paste("file-path-wrapper", paste0("text-", colornm)),
      shiny::tags$input(
        class = "file-path validate",
        type = "text"
      )
    ),
    includeInHead(
      "materialize-file.js",
      "materialize-file.css",
      style = paste0(
        '/* label focus color */
        .text-', colornm,' input[type=text]:not(.browser-default):focus:not([readonly]) + label {
          color: ', colorhex,';
        }
        /* label underline focus color */
        .text-', colornm,' input[type=text]:not(.browser-default):focus:not([readonly]) {
          border-bottom: 1px solid ', colorhex,';
          box-shadow: 0 1px 0 0 ', colorhex,';
        }
        /* label underline valid color */
        .text-', colornm,' input[type=text].valid:not(.browser-default) {
          border-bottom: 1px solid ', colorhex,';
          box-shadow: 0 1px 0 0 ', colorhex,';
        }'
      )
    )
  )
}
