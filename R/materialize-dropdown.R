#' The material Dropdown Menu UI Element
#'
#' The material Dropdown Menu UI Element
#' @param inputId String. The input identifier used to access the value.
#' @param trigger tagList. The trigger element for the dropdown. Could be any tagList element, for exemple a'material_button'.
#' @param ddlist List. The dropdown element list.The list need to contain a 'target' element and in adition could contain 'name', 'badge' and 'icon' elements.
#' @param bgcolor String. The color name for Dropdown backgroud. Leave empty for 'white' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param color String. The color name of the Checkbox. Leave empty for the 'teal lighten-1' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param session Shiny default reactive domain.
#' @examples
#' require(materializer)
#' material_dropdown(
#'   inputId = "example_dropdown_menu",
#'   trigger = material_button(
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
material_dropdown <- function(inputId, trigger, ddlist, bgcolor = "white", color = NULL) {

  if (is.null(color)) color <- default_color
  colornm <- css.names(color)
  colorhex <- material_colormap(color)
  bgcolorhex <- material_colormap(bgcolor)

  shiny::tagList(
    if (!is.null(trigger)) {
      shiny::tagAppendAttributes(
        trigger,
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
              li[["name"]],
              if (!is.null(li[["badge"]])) {
                material_badge(
                  inputId = paste0(inputId,"_badge"),
                  label = li[["badge"]],
                  color = color
                )
              }
            )
          )
        }
      }),
      includeInHead(
        "materialize-dropdown.js",
        "materialize-dropdown.css",
        style = paste0('
          .dropdown-content {
            background-color:', bgcolorhex,';
          }
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
