#' Create a card that will contain UI content
#'
#' UI content can be placed in cards to organize items on a page.
#' @param ... tagList. The UI elements to place in the card
#' @param title String. The title of the card
#' @param img String. The filepath of a image of the card
#' @param footer tagList. The UI elements to place in the card footer
#' @param class String. The aditional class to the card. Values should be stacked or panel.
#' @param header Logical. Option to include a header in the card.
#' @param tabs tgList. A material_tabs object to insert inside the card
#' @param depth Integer. The amount of depth of the card. The value should be between 0 and 5. Leave empty for the default depth.
#' @param horizontal Logical. Should the card be on horizontal orientation?'
#' @param hoverable Loginal. Enable/disable hover effect.
#' @param bgcolor String. The background color name of the card. Leave empty for the 'teal lighten-1' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @examples
#' material_card(
#'   title = "Example Card",
#'   shiny::h5("Card Content"),
#'   footer = shiny::hr()
#' )
#' @export
material_card <- function(..., title = NULL, img = NULL, footer = NULL, class = "stacked", header = TRUE, tabs = NULL, depth = NULL, horizontal = FALSE, hoverable = TRUE, bgcolor = NULL) {

    shiny::div(
      class = paste(
        "materialize-card",
        "card",
        if (hoverable) "hoverable",
        ifDef(depth, "z-depth-"),
        if (horizontal) "horizontal",
        ifDef(bgcolor)
      ),
      if (header) {
        shiny::div(
          class = ifelse(is.null(img), "card-header", "card-image"),
          if (!is.null(img)) shiny::img(src = img),
          shiny::span(
            class = "card-title",
            title
          )
        )
      },
      shiny::div(
        class = paste0("card-", class),
        shiny::div(
          class = "card-content",
          ...
        ),
        if (!is.null(tabs)) {
            tabs
        },
        if (!is.null(footer)) {
          shiny::div(
            class = "card-action",
            footer
          )
        }
      ),
      includeInHead("materialize-card.css")
    )
}
