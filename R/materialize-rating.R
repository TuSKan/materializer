#' Create a materialize rating
#'
#' Build a materialize rating
#' @param inputId String. The input identifier used to access the value.
#' @param n integer The number of stars
#' @param checked Double The rating value, cloud be half values.
#' @param size String. The size of the star rating. Could be any css length.
#' @param space String. THe space between the stars. Could be any css length.
#' @param disabled Boolean. Is the rating disable?
#' @param color String. The color name of the Checkbox. Leave empty for the 'yellow accent-4' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param ... Aditional parameters
#' @examples
#' require(materializer)
#' material_rating(
#'   inputId = "examplerating",
#'   n = 5,
#'   checked = 3.5,
#'   color = 'teal lighten-1'
#' )
#' @export

material_rating <- function(inputId, n = 5L, checked = 3, size = "1.25em", space = "3em", disabled = FALSE, color = NULL, ...) {
  if (is.null(color)) color <- "yellow accent-4"
  colorhex <- material_colormap(color)
  css.names(color)
  checked = ifelse(is.na(as.numeric(checked)) || is.null(checked), 0, as.numeric(checked))

  shiny::tags$fieldset(
    id = inputId,
    class = paste("materialize-rating", "rating", css.names(color), paste0("size",size,"space",space)),
    lapply(n:1, function(i) {
      shiny::tagList(
        shiny::tags$input(
          type = "radio",
          id = paste0(inputId,"_star_",i),
          name = inputId,
          value = i,
          checked = if (i == checked) "checked",
          disabled = if (disabled) NA
        ),
        shiny::tags$label(
          class = "full",
          "for" = paste0(inputId,"_star_",i),
          title = paste(i, "stars")
        ),
        shiny::tags$input(
          type = "radio",
          id = paste0(inputId,"_star_",i - 0.5),
          name = inputId,
          value = i - 0.5,
          checked = if (i - 0.5 == checked) "checked",
          disabled = if (disabled) NA
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
        '.rating', '.', css.names(color), '.', paste0("size",size,"space",space),' > input:checked ~ label,\n',
        '.rating', '.', css.names(color), '.', paste0("size",size,"space",space),':not(:checked) > input:not(:disabled) ~ label:hover,\n',
        '.rating', '.', css.names(color), '.', paste0("size",size,"space",space),':not(:checked) > input:not(:disabled) ~ label:hover ~ label { color: ', colorhex, ' !important; };'
      ))
    ),
    includeInHead(
      style = shiny::HTML(paste0(
        '.rating', '.', css.names(color), '.', paste0("size",size,"space",space),'  > input:not(:disabled):checked + label:hover,\n',
        '.rating', '.', css.names(color), '.', paste0("size",size,"space",space),'  > input:not(:disabled):checked ~ label:hover,\n',
        '.rating', '.', css.names(color), '.', paste0("size",size,"space",space),'  > label:hover ~ input:not(:disabled):checked ~ label,\n',
        '.rating', '.', css.names(color), '.', paste0("size",size,"space",space),'  > input:not(:disabled):checked ~ label:hover ~ label { color: rgba(', paste(hex2rgb(colorhex) - 30,collapse = ","),',1) !important; };'
      ))
    ),
    includeInHead(
      style = shiny::HTML(paste0(
        '.rating', '.', css.names(color), '.', paste0("size",size,"space",space),' > label:before { margin: ',space,'; font-size: ',size,'; !important;};'
      ))
    ),
    ...
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
