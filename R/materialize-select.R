#' Create a materialize select
#'
#' Build a materialize select
#' @param inputId String. The input identifier used to access the value.
#' @param label String. The dropdown label.
#' @param choices Named vector. The option names and underyling values.
#' @param selected String. The initially selected underyling value.
#' @param multiple Boolean. Can multiple items be selected?
#' @param color String. The color name of the select input. Leave empty for 'teal lighten-1' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param session Shiny default reactive domain
#' @examples
#' material_select(
#'   inputId = "example_dropdown",
#'   label = "Drop down",
#'   choices = c(
#'     "Chicken" = "c",
#'     "Steak" = "s",
#'     "Fish" = "f"
#'   ),
#'   selected = c("c"),
#'   multiple = FALSE,
#'   color = 'teal lighten-1'
#' )
#' @export
material_select <- function(inputId, label, choices = NULL, selected = NULL, multiple = FALSE, color = NULL) {

  if (is.null(color)) color <- default_color
  colornm <- css.names(color)
  colorhex <- material_colormap(color)

  values <- unname(choices)
  choices <- names(choices)
  if (is.null(choices)) choices <- values
  selected <- values %in% selected


  shiny::div(
    class = paste("input-field",paste0("select-",colornm)),
    shiny::tags$select(
      class = "materialize-select",
      id = inputId,
      multiple = if (multiple) NA,
      lapply(
        seq_along(choices),
        function(i) {
          shiny::tags$option(
            value = values[[i]],
            choices[[i]],
            selected = if (selected[[i]]) NA
          )
        }
      )
    ),
    shiny::tags$label(
      "for" = inputId,
      label
    ),
    includeInHead(
      "materialize-select.js",
      "materialize-select.css",
      style = paste0(
        ".select-", colornm, " ul.dropdown-content.select-dropdown li span {
          color: ", colorhex, ";
        }
        .select-", colornm, " .select-wrapper input.select-dropdown:focus {
          border-bottom: 1px solid ", colorhex, ";
        }"
      )
    )
  )

}

#' @rdname material_select
#' @export
update_material_select <- function(inputId, choices = NULL, selected = NULL, label = NULL, session = shiny::getDefaultReactiveDomain()) {
  values <- unname(choices)
  choices <- names(choices)
  if (is.null(choices)) choices <- values
  session$sendInputMessage(
    inputId,
    cleanList(
      choices = as.list(choices),
      values = as.list(values),
      selected = selected,
      label = label
    )
  )
}

