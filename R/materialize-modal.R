#' Place UI content in a modal
#'
#' Put any UI object inside of a modal. The modal will open when the button is pressed.
#' @param inputId String. The ID for the modal. Must be unique per application.
#' @param ... The UI elements to place in the modal
#' @param btnShow Button. The modal's show button tag.
#' @param btnClose Button. The modal's close button tag.
#' @param fixedFooter Logical. Should the footer be fixed?
#' @examples
#' material_modal(
#'   inputId = "example_modal",
#'   shiny::tags$p("Modal Content")
#' )
#' @export
material_modal <- function(inputId, ...,
                           btnShow = material_button(paste0(inputId,"_show"), "Show"),
                           btnClose = material_button(paste0(inputId,"_close"), "Close", class = "flat"),
                           fixedFooter = FALSE) {

  shiny::div(
    class = "materialize-modal",
    shiny::tagAppendAttributes(
      btnShow,
      "data-target" = inputId,
      class = "modal-trigger"
    ),
    shiny::div(
      id = inputId,
      class = paste("modal", if (fixedFooter) "modal-fixed-footer"),
      shiny::div(
        class = "modal-content",
        ...
      ),
      shiny::div(
        class = "modal-footer",
        shiny::tagAppendAttributes(
          btnClose,
          class = "modal-action modal-close"
        )
      )
    ),
    includeInHead("materialize-modal.js")
  )
}
