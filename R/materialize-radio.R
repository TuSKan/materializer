#' Create a materialize radio button
#'
#' Build a materialize radio button.
#' @param inputId String. The input identifier used to access the value.
#' @param choices Named vector or a list. The radio names and underyling values as a named vector or a list with 'names' and 'values' elements with same lenght.
#' @param selected String. The initially selected underyling value.
#' @param disabled String. The radio button should be disabled?
#' @param class String. Aditional class for checkbox. Values should be with-gap or NULL
#' @param inline Logical. The option to create the radio buttons inline.
#' @param color String. The color name of the radio buttons. Leave empty for 'teal lighten-1' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param session Shiny default reactive domain.
#' @examples
#' require(materializer)
#' material_radio(
#'   inputId = "example_radio_button",
#'   choices = c(
#'     "Cake" = "c",
#'     "Pie" = "p",
#'     "Brownie" = "b"
#'   ),
#'   color = 'teal lighten-1'
#' )
#' @export
material_radio <- function(inputId, choices, selected = NULL, disabled = NULL, class = "with-gap", inline = FALSE, color = NULL) {
  if (is.null(color)) color <- default_color
  colornm <- css.names(color)
  colorhex <- material_colormap(color)

  if (is.list(choices)) {
    values <- choices$values
    choices <- choices$names
  } else {
    values <- unname(choices)
    choices <- names(choices)
    if (is.null(choices)) choices <- values
  }

  selected <- values %in% selected
  disabled <- values %in% disabled

  shiny::tags$div(
    id = inputId,
    class = paste(paste0("radio-", colornm), "materialize-radio"),
    style = if (inline) "text-align: left; display: grid; grid-gap: 1em; grid-template-columns: repeat(auto-fit, minmax(5em, 1fr));",
    lapply(
      seq_along(choices),
      function(i) {
        shiny::tags$p(
          style = "text-align:justify",
          shiny::tags$label(
            shiny::tags$input(
              type = "radio",
              name = inputId,
              class = if (!is.null(class)) class,
              value = values[[i]],
              checked = if (selected[[i]]) NA,
              disabled = if (disabled[[i]]) "disabled"
            ),
            if (is.character(choices[[i]])) {
              shiny::tags$span(
                choices[[i]]
              )
            } else {
              choices[[i]]
            }
          )
        )
      }
    ),
    includeInHead(
      "materialize-radio.js",
      "materialize-radio.css",
      style = paste0(
        '.radio-', colornm,' input[type="radio"]:checked + span:after,
        .radio-', colornm,' input[type="radio"].with-gap:checked + span:before,
        .radio-', colornm,' input[type="radio"].with-gap:checked + span:after {
          border: 2px solid ', colorhex,';
        }
        .radio-', colornm,' input[type="radio"]:checked + span:after,
        .radio-', colornm,' input[type="radio"].with-gap:checked + span:after {
          border: 2px solid ', colorhex,';
          background-color: ', colorhex,';
        }'
      )
    )
  )
}


#' @rdname material_radio
#' @export
update_material_radio <- function(inputId, choices = NULL, selected = NULL, disabled = NULL, session = shiny::getDefaultReactiveDomain()) {
  values <- unname(choices)
  choices <- names(choices)
  if (is.null(choices)) choices <- values
  session$sendInputMessage(
    inputId,
    cleanList(
      choices = as.list(choices),
      values = as.list(values),
      selected = selected,
      disabled = disabled
    )
  )
}
