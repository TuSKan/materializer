#' Create a materialize fab action button (fab)
#'
#' Build a materialize button. The initial value is zero, and increases by one on each press.
#' @param inputId String. The input identifier used to access the value.
#' @param actlist List. A list of action attributes such as target, icon, size, color and icolor.
#' @param icon String The name of the icon. Leave empty for no icon. Visit \url{http://materializecss.com/icons.html} for a list of available icons.
#' @param size String. The size of the icon. Values should be 'large', 'medium' or 'small'.
#' @param color String. The color name of the fab action button. Leave empty for the 'teal lighten-1' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param icolor String. The color name of the icon. Leave empty for the 'teal lighten-1' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param direction String. The direction of the fab action button when open. values should be 'top', 'right', 'buttom', 'left'.
#' @param fixed Logical. The fab action button should be fixed?
#' @param hover Logical. Should the fab action button be hoveable ?
#' @param position String. The position of the fab action button. Values should be 'bottom-left', 'bottom-right', 'top-left' and 'top-right'.
#' @examples
#' require(materializer)
#' material_fab(
#'   inputId = "example_flt_action",
#'   actlist = list(
#'     c(target = "ex1", icon = "home"),
#'     c(target = "ex2", icon = "chart")
#'   ),
#'   icon = "add",
#'   color = 'teal lighten-1'
#' )
#' @export
material_fab <- function(inputId, actlist = list(), icon = "mode_edit", size = "large", color = NULL, icolor = NULL, direction = "top", position = "bottom-right", fixed = TRUE, hover = TRUE) {

  if (is.null(color)) color <- default_color

  shiny::div(
    id = inputId,
    class = paste(
      "materialize-fab",
      if (!hover) "click-to-toggle",
      paste0("direction-",direction),
      paste0(position,"-action-btn"),
      paste0(size,"-action-btn"),
      "fixed-action-btn"
    ),
    style = if (!fixed) "position: absolute !important;",
    "data-direction" = direction,
    "data-toggle" = ifelse(hover, "hover", "click"),
    shiny::tags$a(
      class = paste("btn-floating", if (size != "medium") paste0("btn-",size), color),
      material_icon(icon = icon, size = size, color = icolor)
    ),
    shiny::tags$ul(
      lapply(actlist, function(li) {
        li <- as.list(li)
        shiny::tags$li(
          do.call(shiny::tagAppendAttributes, c(list(
          shiny::tags$a(
            class = paste("btn-floating", ifDef(li[["size"]], "btn-"), li[["color"]], li[["class"]]),
            href = paste0("#", li[["target"]]),
            material_icon(icon = li[["icon"]], size = li[["size"]], color = li[["icolor"]])
          )),
         as.list(li[["attr"]])
        )))
      })
    ),
    includeInHead(
      "materialize-fab.js",
      "materialize-fab.css"
    )
  )
}
