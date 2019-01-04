#' The material Collapsible UI Element
#'
#' The material Collapsible UI Element
#' @param inputId String. The input identifier used to access the value.
#' @param cllist List. The collapsible element list. The list need to contain a 'name' and 'content' element, in adition could contain 'icon', 'badge' and 'active' (logical) elements.
#' @param class String. A class type for UI Collapsible. Values should be 'accordion', 'expandable' or 'popout'.
#' @param headercolor String. The color name of header. Leave empty for 'white' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param bodycolor String. The color name of body. Leave empty for 'white' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param color String. The color name of the text and icons. Leave empty for the 'teal lighten-1' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @examples
#' require(materializer)
#' material_collapsible(
#' inputId = "example_collapsible_menu",
#'   cllist = list(
#'     c(target = "tgt_1", name = "One"),
#'     c(target = "tgt_2", name = "Two"),
#'     c(target = "tgt_3", name = "Three", icon = "cloud"),
#'     c(target = "tgt_4", icon = "alarm")
#'  )
#' )
#' @export
material_collapsible <- function(inputId, cllist, class = "accordion", headercolor = "white", bodycolor = "white", color = NULL) {

  if (is.null(color)) color <- default_color
  colornm <- css.names(color)
  colorhex <- material_colormap(color)

  if (class == "accordion") class = NULL

  shiny::tags$ul(
    id = inputId,
    class = paste('collapsible', class, 'materialize-collapsible', paste0("collapsible-", colornm)),
    lapply(cllist, function(li) {
      li <- as.list(li)
      if (isEmpty(li)) {
        shiny::tags$li(
          class = "divider",
          tabindex = "-1"
        )
      } else {
        shiny::tags$li(
          class = if (!is.null(li[["active"]])) "active",
          shiny::tags$a(
            class = "collapsible-header",
            href = li[["target"]],
            li[["header"]],
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
          ),
          shiny::tags$div(
            class = "collapsible-body",
            li[["content"]]
          )
        )
      }
    }),
    includeInHead(
      "materialize-collapsible.js",
      style = paste0('
        .collapsible-', colornm,' li a,
        .collapsible-', colornm,' li span {
          color: ', colorhex, ' !important;
        }
        .collapsible-', colornm,' .collapsible-header {
          background-color: ', material_colormap(headercolor),';
        }
        .collapsible-', colornm,' .collapsible-body {
          background-color: ', material_colormap(bodycolor),';
        }'
      )
    )
  )
}



#' @rdname material_collapsible
#' @param session Shiny default reactive domain.
#' @export
update_material_collapsible <- function(inputId, cllist, session = shiny::getDefaultReactiveDomain()) {
  session$sendInputMessage(
    inputId,
    cleanList(cllist = cllist)
  )
}
