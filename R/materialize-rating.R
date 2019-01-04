#' Create a materialize rating
#'
#' Build a materialize rating
#' @param inputId String. The input identifier used to access the value.
#' @param n integer The number of stars
#' @param checked Double The rating value, cloud be half values.
#' @param size Double. The size of the star rating based on 'em' css
#' @param space Double. THe space between the stars based on pixels.
#' @param disabled Boolean. Is the rating disable?
#' @param color String. The color name of the Checkbox. Leave empty for the 'yellow accent-4' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @examples
#' require(materializer)
#' material_rating(
#'   inputId = "examplerating",
#'   n = 5,
#'   checked = 3.5,
#'   color = 'teal lighten-1'
#' )
#' @export

material_rating <- function(inputId, n = 5L, checked = 3, size = 1.25, space = 3, disabled = FALSE, color = NULL) {
  if (is.null(color)) color <- "yellow accent-4"
  colorhex <- material_colormap(color)

  shiny::tags$fieldset(
    id = inputId,
    class = paste("materialize-rating", "rating"),
    lapply(n:1, function(i) {
      tagList(
        shiny::tags$input(
          type = "radio",
          id = paste0(inputId,"_star_",i),
          name = "rating",
          value = i
        ),
        shiny::tags$label(
          class = "full",
          "for" = paste0(inputId,"_star_",i),
          title = paste(i, "stars")
        ),
        shiny::tags$input(
          type = "radio",
          id = paste0(inputId,"_star_",i - 0.5),
          name = "rating",
          value = i - 0.5
        ),
        shiny::tags$label(
          class = "half",
          "for" = paste0(inputId,"_star_",i - 0.5),
          title = paste(i - 0.5, "stars")
        )
      )
    }),
    includeInHead(
      "materialize-rating.js",
      "materialize-rating.css"
    ),
    includeInHead(
      style = shiny::HTML(paste0(
        '.rating > input:checked ~ label,\n',
        '.rating:not(:checked) > input:not(:disabled) ~ label:hover,\n',
        '.rating:not(:checked) > input:not(:disabled) ~ label:hover ~ label { color: ', colorhex, ' !important; };'
      ))
    ),
    includeInHead(
      style = shiny::HTML(paste0(
        '.rating > input:not(:disabled):checked + label:hover,\n',
        '.rating > input:not(:disabled):checked ~ label:hover,\n',
        '.rating > label:hover ~ input:not(:disabled):checked ~ label,\n',
        '.rating > input:not(:disabled):checked ~ label:hover ~ label { color: rgba(', paste(hex2rgb(colorhex) - 30,collapse = ","),',1) !important; };'
      ))
    ),
    includeInHead(
      style = shiny::HTML(paste0(
        '.rating > label:before { margin: ',space,'px; font-size: ',size,'em; !important;};'
      ))
    )
  )
}



#' @rdname material_rating
#' @param session Shiny default reactive domain.
#' @export
update_material_rating <- function(inputId, checked = NULL, disabled = NULL, session = shiny::getDefaultReactiveDomain()) {
  session$sendInputMessage(
    inputId,
    cleanList(
      checked = checked,
      disabled = disabled
    )
  )
}
