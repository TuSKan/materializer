#' Material Tags (Chips)
#'
#' Createa material tag element
#' @param inputId String.
#' @param tags list. A list of tag elements, could have 'tag', 'icon', 'image'.
#' @param readonly Boolean. Should the tags be readonly?
#' @param placeholder String. A placeholder for the input text.
#' @param autocomplete String. A list of words to autocomplete
#' @param color String. The color name of the text input. Leave empty for 'teal lighten-1' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param ... tagList. Any additional tag list
#' @examples
#' require(materializer)
#' material_tags(
#'   inputId = "extags",
#'   tags = list(c(tag = "Apple", icon = "close")),
#'   placeholder = "BigTech Companies"
#' )
#' @export
material_tags <- function(inputId, tags = list(), readonly = FALSE, placeholder = "", autocomplete = NULL, color = NULL, ...) {
  if (is.null(color)) color <- default_color
  colorhex <- material_colormap(color)

  shiny::tagAppendAttributes(
  shiny::div(
    id = inputId,
    class = paste(
      "materialize-tags",
      "chips",
      if (length(tags) > 0) "chips-initial",
      if (!is.null(placeholder)) "chips-placeholder",
      if (!is.null(autocomplete)) "chips-autocomplete"
    ),
    "readonly" = if (readonly) NA,
    if (readonly) {
      lapply(tags, function(tag) {
        tag <- as.list(tag)
        shiny::div(
          class = "chip",
          if (!is.null(tag[["image"]])) shiny::img(src = tag[["image"]]),
          tag[["tag"]]
        )
      })
   },
    ...,
    includeInHead(
      "materialize-tags.js",
      style = ifelse(
        readonly,
        paste0(
        '.chips {
          border-bottom: none;
          -webkit-box-shadow: none;
          box-shadow: none;
        }'),
        paste0(
        '.chips.focus {
          border-bottom: 1px solid ', colorhex, ';
          -webkit-box-shadow: 0 1px 0 0 ', colorhex, ';
          box-shadow: 0 1px 0 0 ', colorhex, ';
        }'
       ))
    )
  ),
  "data-initial" = jsonlite::toJSON(lapply(tags, as.list), auto_unbox = TRUE),
  "data-placeholder" = placeholder,
  "data-autocomplete" = jsonlite::toJSON(autocomplete,auto_unbox = TRUE)
  )
}

#' @rdname material_tags
#' @param addtags list. Tags to be added, list of tags with elements 'tag'.
#' @param deltags list. Tags to be deleted, list of positions
#' @param seltags list. Tags to be selected, list of positions
#' @param session Shiny default reactive domain.
#' @export
update_material_tags <- function(inputId, addtags = NULL, deltags = NULL, seltags = NULL, session = shiny::getDefaultReactiveDomain()) {
  session$sendInputMessage(
    inputId,
    cleanList(
      addtags = addtags,
      deltags = unname(sapply(deltags, as.numeric)),
      seltags = unname(sapply(seltags, as.numeric))
    )
  )
}

