#' Create a materialize checkbox
#'
#' Build a materialize checkbox. The value is a boolean (TRUE if checked, FALSE if not checked).
#' @param inputId String. The input identifier used to access the value.
#' @param label String. The checkbox label.
#' @param checked Boolean. Is the checkbox initially checked?
#' @param class String. Aditional class for checkbox. Values should be filled-in or NULL
#' @param color String. The color name of the Checkbox. Leave empty for the 'teal lighten-1' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param session Shiny default reactive domain.
#' @examples
#' material_checkbox(
#'   inputId = "example_checkbox",
#'   label = "Checkbox",
#'   checked = TRUE,
#'   color = 'teal lighten-1'
#' )
#' @export
material_checkbox <- function(inputId, label, checked = FALSE, class = "filled-in", color = NULL) {

  if (is.null(color)) color <- default_color
  colornm <- css.names(color)
  colorhex <- material_colormap(color)

  shiny::tags$p(
    class = paste0("checkbox-", colornm),
    shiny::tags$label(
      shiny::tags$input(
        type = "checkbox",
        id = inputId,
        class = paste("materialize-checkbox", if (!is.null(class)) class),
        checked = if (checked) "checked"
      ),
      shiny::tags$span(
        label
      )
    ),
    includeInHead(
      "materialize-checkbox.js",
      "materialize-checkbox.css",
      style = paste0(
        '.checkbox-', colornm,' input[type="checkbox"]:checked:not(:disabled) + span:not(.lever):after {
            border: 2px solid ', colorhex,';
            background-color: ', colorhex,';
        }'
      )
    )
  )
}

#' @rdname material_checkbox
#' @export
update_material_checkbox <- function(inputId, label = NULL, checked = FALSE, session = shiny::getDefaultReactiveDomain()) {
  session$sendInputMessage(
    inputId,
    cleanList(
      label = label,
      checked = checked
    )
  )
}
