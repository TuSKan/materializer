#' Create a materialize floating action button (fab)
#'
#' Build a materialize button. The initial value is zero, and increases by one on each press.
#' @param inputId String. The input identifier used to access the value.
#' @param icon String The name of the icon. Leave empty for no icon. Visit \url{http://materializecss.com/icons.html} for a list of available icons.
#' @param size String. The size of the icon. Values should be 'large', 'medium' or 'small'.
#' @param color String. The color name of the floating action button. Leave empty for the 'teal lighten-1' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param direction String. The direction of the floating action button when open. values should be 'top', 'right', 'buttom', 'left'.
#' @param fixed Logical. The floating action button should be fixed?
#' @param hover Logical. Should the floating action button be hoveable ?
#' @param position String. The position of the floating action button. Values should be 'bottom-left', 'bottom-right', 'top-left' and 'top-right'.
#' @param action List. A list of action attributes such as target, icon, size and color.
#' @examples
#' material_fab(
#'   inputId = "example_flt_action",
#'   icon = "add",
#'   color = 'teal lighten-1',
#'   action = list(
#'     target = c("id1", "id2", "id3", "id4"),
#'     icon = c("model_edit", "insert_chart", "attach_file", "publish")
#'   )
#' )
#' @export
material_fab <- function(inputId, icon, size = "large", color = NULL, direction = "left", position = "bottom-right", fixed = TRUE, hover = TRUE,
                              action = list(target = NULL, icon = NULL, size = NULL, color = NULL)) {

  if (is.null(color)) color <- default_color
  if (is.null(action$color)) action$color <- color

  n <- length(action$target)
  if (length(action$icon) > 0) action$icon <- c(action$icon, rep(action$icon[[length(action$icon)]], n - length(action$icon)))
  if (length(action$color) > 0) action$color <- c(action$color, rep(action$color[[length(action$color)]], n - length(action$color)))
  if (length(action$size) > 0) action$size <- c(action$size, rep(action$size[[length(action$size)]], n - length(action$size)))

  shiny::div(
    id = inputId,
    class = paste(
      if (!hover) "click-to-toggle",
      paste0("direction-",direction),
      paste0(position,"-action-btn"),
      paste0(size,"-action-btn"),
      "fixed-action-btn",
      "materialize-floating"
    ),
    style = if (!fixed) "position: absolute !important;",
    "data-direction" = direction,
    "data-toggle" = ifelse(hover, "hover", "click"),
    shiny::tags$a(
      class = paste("btn-floating", if (size != "medium") paste0("btn-",size), ifDef(color)),
      shiny::tags$i(class = "material-icons left", icon)
    ),
    shiny::tags$ul(
      lapply(
        1:n,
        function(i) {
          shiny::tags$li(
            shiny::tags$a(
              class = paste("btn-floating", ifDef(action$size[[i]], "btn-"), ifDef(action$color[[i]])),
              href = paste0("#", action$target[[i]]),
              shiny::tags$i(class = "material-icons", action$icon[[i]])
            )
          )
        }
      )
    ),
    includeInHead(
      "materialize-floating.js",
      "materialize-floating.css"
    )
  )
}




