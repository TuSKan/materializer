#' Create a materialize radio button
#'
#' Build a materialize radio button.
#' @param inputId String. The input identifier used to access the value.
#' @param choices Named vector. The radio names and underyling values.
#' @param selected String. The initially selected underyling value.
#' @param disabled String. The radio button label.
#' @param class String. Aditional class for checkbox. Values should be with-gap or NULL
#' @param inline Logical. The option to create the radio buttons inline.
#' @param color String. The hex code color of the radio buttons. Leave empty for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param session Shiny default reactive domain.
#' @examples
#' material_radio(
#'   inputId = "example_radio_button",
#'   choices = c(
#'     "Cake" = "c",
#'     "Pie" = "p",
#'     "Brownie" = "b"
#'   ),
#'   color = "#ef5350"
#' )
#' @export
material_radio <- function(inputId, choices, selected = NULL, disabled = NULL, class = "with-gap", inline = FALSE, color = NULL) {
  if (is.null(color)) color <- default_color
  colornm <- css.names(material_colormap(color))

  values <- unname(choices)
  choices <- names(choices)
  if (is.null(choices)) choices <- values
  selected <- values %in% selected
  disabled <- values %in% disabled

  shiny::tags$div(
    id = inputId,
    class = paste(paste0("radio-", colornm), "materialize-radio"),
    lapply(
      seq_along(choices),
      function(i) {
        shiny::tags$p(
          class = if (inline) "inline",
          shiny::tags$label(
            shiny::tags$input(
              type = "radio",
              name = inputId,
              class = if (!is.null(class)) class,
              value = values[[i]],
              checked = if (selected[[i]]) NA,
              disabled = if (disabled[[i]]) "disabled"
            ),
            shiny::tags$span(
              choices[[i]]
            )
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
          border: 2px solid ', color,';
        }
        .radio-', colornm,' input[type="radio"]:checked + span:after,
        .radio-', colornm,' input[type="radio"].with-gap:checked + span:after {
          border: 2px solid ', color,';
          background-color: ', color,';
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
