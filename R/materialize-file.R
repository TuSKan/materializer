#' Create a materialize file input
#'
#' Build a materialize file input.
#' @param inputId String. The input identifier used to access the value.
#' @param label String. The file input button text.
#' @param server Logical. Should the file be selected on server-side rather than client-side?
#' @param multiple logical. Should select multiples files?
#' @param icon String. The name of the icon. Leave empty for no icon. Visit \url{http://materializecss.com/icons.html} for a list of available icons.
#' @param class String. Aditional class for button. Value should be 'btn-round', 'btn-large' or 'btn-small'.
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
material_file <- function(inputId, label, server = FALSE, multiple = FALSE, icon = "file_upload", class = NULL, depth = NULL, color = NULL) {
  if (is.null(color)) color <- default_color
  colornm <- css.names(color)
  colorhex <- material_colormap(color)

  shiny::div(
    class = "file-field input-field materialize-file",
    if (server) {
      shiny::tags$button(
        id = paste0(inputId,"-trigger"),
        type = "file",
        multiple = if (multiple) NA,
        "data-side" = "server",
        "data-target" = paste0(inputId,"-modal"),
        value = 0,
        class = paste(
          "waves-effect waves-light btn materialize-file modal-trigger",
          ifDef(class),
          ifDef(depth, "z-depth-"),
          ifDef(color)
        ),
        shiny::tags$i(
          class =
            "material-icons left",
          icon
        ),
        label
      )
    } else {
      shiny::div(
        class = paste(
          "waves-effect waves-light btn",
          ifDef(class),
          ifDef(depth, "z-depth-"),
          ifDef(color)
        ),
        shiny::tags$i(
          class =
            "material-icons left",
          icon
        ),
        shiny::tags$span(
          label
        ),
        shiny::tags$input(
          id = inputId,
          type = "file",
          multiple = if (multiple) NA,
          class = "materialize-file",
          "data-side" = "client"
        )
      )
    },
    shiny::div(
      class = paste("file-path-wrapper", paste0("text-", colornm)),
      shiny::tags$input(
        id = paste0(inputId,"-path"),
        class = "file-path validate",
        type = "text"
      )
    ),
    if (server) {
      shiny::div(
        id =  paste0(inputId,"-modal"),
        class = paste("modal","modal-fixed-footer","server-modal","materialize-modal"),
        shiny::div(
          class = "modal-content",
          cuteFileBrowser::cuteFileBrowserUI(inputId)
        ),
        shiny::div(
          class = "modal-footer",
          shiny::tags$a(
            id = paste0(inputId,"-modal-close"),
            href = "#!",
            class = "modal-close waves-effect waves-green btn-flat",
            "Close"
          )
        )
      )
    },
    includeInHead(
      "materialize-file.js",
      "materialize-file.css",
      if (server) "materialize-modal.js",
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
        }
        .cuteFileBrowser .data li {
          background-color: rgba(', paste(hex2rgb(colorhex),collapse = ","),',0.2) !important;
        }
        .cuteFileBrowser .data li:hover {
          background-color: rgba(', paste(hex2rgb(colorhex),collapse = ","),',0.3) !important;
        }
        .cuteFileBrowser .data li.selected {
          background-color: rgba(', paste(hex2rgb(colorhex),collapse = ","),',0.5) !important;
        }
        .server-modal {
          max-height: 100% !important;
          height: 80% !important;
          width: 75% !important;
          background-color: #f5f5f5;
        }
        '
      )
    )
  )
}


#' @rdname material_file
#' @param input Shiny server input.
#' @param rootDirectory String. The begin directory to browser. Read-only access needed.
#' @param session Shiny default reactive domain.
#' @export
update_material_file <- function(input, inputId, rootDirectory, session = shiny::getDefaultReactiveDomain()) {
  shiny::observeEvent(input[[paste0(inputId,"-modal-show")]], {
    cuteFileBrowser::cuteFileBrowserServer(inputId = inputId, rootDirectory = rootDirectory, session = session)
  }, ignoreInit = TRUE, once = TRUE)
  shiny::observeEvent(input[[paste0(inputId,"-modal-close")]], {
    session$sendInputMessage(paste0(inputId,"-path"), list(value = input[[inputId]]$name) )
  }, ignoreInit = TRUE)
}
