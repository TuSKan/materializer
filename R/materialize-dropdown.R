#' The material Dropdown Menu UI Element
#'
#' The material Dropdown Menu UI Element
#' @param inputId String. The input identifier used to access the value.
#' @param button String. The tooltip message.
#' @param ddlist List. The dropdown element list.The list need to contain a 'target' element and in adition could contain 'name' and 'icon' elements.
#' @param color String. The color name of the Checkbox. Leave empty for the 'teal lighten-1' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param session Shiny default reactive domain.
#' @examples
#' material_dropdown(
#' inputId = "example_dropdown_menu",
#'   button = material_button(
#'     inputId = "example_button",
#'     label = "Drop me",
#'     icon = "arrow_drop_down"
#'   ),
#'   ddlist = list(
#'     c(target = "tgt_1", name = "One"),
#'     c(target = "tgt_2", name = "Two"),
#'     NULL,
#'     c(target = "tgt_3", name = "Three", icon = "cloud"),
#'     c(target = "tgt_4", icon = "alarm")
#'  )
#' )
#' @export
material_dropdown <- function(inputId, button, ddlist, color = NULL) {

  if (is.null(color)) color <- default_color
  colornm <- css.names(color)
  colorhex <- material_colormap(color)

  shiny::tagList(
    if (!is.null(button)) {
      shiny::tagAppendAttributes(
        button,
        class = 'dropdown-trigger',
        "data-target" = inputId
      )
    },
    shiny::tags$ul(
      id = inputId,
      class = paste('dropdown-content', 'materialize-dropdown', paste0("dropdown-", colornm)),
      lapply(ddlist, function(li) {
        li <- as.list(li)
        if (isEmpty(li)) {
          shiny::tags$li(
            class = "divider",
            tabindex = "-1"
          )
        } else {
          shiny::tags$li(
            shiny::tags$a(
              href = li[["target"]],
              if (!is.null(li[["icon"]])) {
                shiny::tags$i(
                  class = "material-icons",
                  li[["icon"]]
                )
              },
              li[["name"]]
            )
          )
        }
      }),
      includeInHead(
        "materialize-dropdown.js",
        "materialize-dropdown.css",
        style = paste0('
          .dropdown-', colornm,' li a,
          .dropdown-', colornm,' li span {
            color: ', colorhex, ' !important;
          }'
        )
      )
    )
  )
}



#' @rdname material_dropdown
#' @export
update_material_dropdown <- function(inputId, ddlist, session = shiny::getDefaultReactiveDomain()) {
  session$sendInputMessage(
    inputId,
    cleanList(
      ddlist = ddlist
    )
  )
}