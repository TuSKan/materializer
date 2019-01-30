#' Place UI content in a modal
#'
#' Put any UI object inside of a modal. The modal will open when the button is pressed.
#' @param inputId String. The ID for the modal. Must be unique per application.
#' @param content The UI elements to place in the modal
#' @param footer  The UI elements to place in the footer
#' @param fixedFooter Logical. Should the footer be fixed?
#' @param bgcolor Body background color. Leave blank for "grey lighten-4" color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param ... tagList. Aditional tag elements.
#' @examples
#' require(materializer)
#' material_modal(
#'   inputId = "modal",
#'   content = shiny::tags$p("Modal Content"),
#'   footer = material_modal_close(
#'     material_button("close", icon = "close", class = "flat")
#'   )
#' )
#' material_modal_trigger(
#'   triggerId = "modal",
#'   material_button("show", icon = "open_in_new", class = "round")
#' )
#' @export
material_modal <- function(inputId, content, footer = NULL, fixedFooter = FALSE, bgcolor = "grey lighten-4", ...) {
  shiny::div(
    id = inputId,
    class = paste("materialize-modal", "modal", if (fixedFooter) "modal-fixed-footer"),
    shiny::div(
      class = "modal-content",
      content
    ),
    shiny::div(
      class = "modal-footer",
      footer
    ),
    ...,
    includeInHead(
      "materialize-modal.js",
      style = paste0(
        '#', inputId, ' {
          background-color: ',material_colormap(bgcolor),';
        }'
      )
    )
  )
}

#' @rdname material_modal
#' @param tagList A tagList (button) to trigger/close the modal
#' @param triggerId The Id to be triggered.
#' @export
material_modal_trigger <- function(tagList, triggerId) {
  shiny::tagAppendAttributes(
    tagList,
    "data-target" = triggerId,
    class = "modal-trigger"
  )
}

#' @rdname material_modal
#' @export
material_modal_close <- function(tagList) {
  shiny::tagAppendAttributes(
    tagList,
    class = "modal-action modal-close"
  )
}
