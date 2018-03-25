#' Create a materialize text box
#'
#' Build a materialize text input
#' @param inputId String. The input identifier used to access the value.
#' @param label String. The text input label.
#' @param placeholder String. The placeholder of the text input
#' @param inline Logical. The text input should be inline with others elements?. Value should be TRUE or FALSE
#' @param readonly Logical. The text input should be read-only?. Value should be TRUE or FALSE
#' @param help String. The helper text below text input.
#' @param type String. The type of the text input. Valiue should be text, email, password.
#' @param icon String. The name of the icon. Leave empty for no icon. Visit \url{http://materializecss.com/icons.html} for a list of available icons.
#' @param color String. The hex code color of the text box. Leave empty for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors. \emph{This input requires using color hex codes, rather than the word form. E.g., "#ef5350", rather than "red lighten-1".}
#' @param session Shiny default reactive domain.
#' @examples
#' material_text(
#'   inputId = "example_text",
#'   label = "Label",
#'   color = "#ef5350"
#' )
#' @export
material_text <- function(inputId, label, placeholder = NULL, inline = FALSE, readonly = FALSE, help = NULL, type = "text", icon = NULL, color = NULL) {

  if (is.null(color)) color <- default_color
  colornm <- css.names(material_colormap(color))

  shiny::tags$div(
    id = paste0("inputField",inputId),
    class = paste("input-field", if (inline) "inline", paste0("textinput-", colornm) ,"materialize-text"),
    if (!is.null(icon)) {
      shiny::tags$i(
        class = "material-icons prefix",
        icon
      )
    },
    shiny::tags$input(
      disable = if (readonly) NA,
      id = inputId,
      placeholder = placeholder,
      type = type,
      class = "validate"
    ),
    shiny::tags$label(
      "for" = inputId,
      label
    ),
    if (!is.null(help)) {
      shiny::tags$span(
        class = "helper-text",
        "data-error" = "wrong",
        "data-success" = "right",
        help
      )
    },
    includeInHead(
      "materialize-text.js",
      "materialize-text.css",
      style = paste0(
      '/* label focus color */
        .textinput-', colornm,' input[type=',type,']:not(.browser-default):focus:not([readonly]) + label {
          color: ', color,';
        }
      /* label underline focus color */
        .textinput-', colornm,' input[type=',type,']:not(.browser-default):focus:not([readonly]) {
          border-bottom: 1px solid ', color,';
          box-shadow: 0 1px 0 0 ', color,';
        }
      /* label underline valid color */
          .textinput-', colornm,' input[type=',type,'].valid:not(.browser-default) {
          border-bottom: 1px solid ', color,';
          box-shadow: 0 1px 0 0 ', color,';
      }
      /* icon prefix focus color */
        .textinput-', colornm,' .prefix.active {
          color: ', color,';
        }'
      )
    )
  )

}


#' @rdname material_text
#' @export
update_material_text <- function(inputId, label = NULL, placeholder = NULL, readonly = NULL, help = NULL, session = shiny::getDefaultReactiveDomain()) {
  session$sendInputMessage(
    paste0("inputField",inputId),
    cleanList(
      label = label,
      placeholder = placeholder,
      readonly = readonly,
      help = help
    )
  )
}
