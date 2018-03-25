#' Create a card that will contain UI content
#'
#' UI content can be placed in cards to organize items on a page.
#' @param ... The UI elements to place in the card
#' @param title String. The title of the card
#' @param img String. The filepath of a image of the card
#' @param footer The UI elements to place in the card footer
#' @param class The aditional class to the card. Values shound be stacked or panel.
#' @param header Option to include a header in the card.
#' @param depth Integer. The amount of depth of the card. The value should be between 0 and 5. Leave empty for the default depth.
#' @param horizontal Should the card be on horizontal orientation?
#' @examples
#' material_card(
#'   title = "Example Card",
#'   shiny::h5("Card Content"),
#'   footer = shiny::hr()
#' )
#' @export
material_card <- function(..., title = NULL, img = NULL, footer = NULL, class = "stacked", header = TRUE, depth = NULL, horizontal = FALSE) {

    shiny::div(
      class = paste("card", ifDef(depth, "z-depth-"), ifDef(horizontal, "horizontal")),
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
