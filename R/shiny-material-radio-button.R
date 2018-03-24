#' Create a shinymaterial radio button
#'
#' Build a shinymaterial radio button.
#' @param inputId String. The input identifier used to access the value.
#' @param label String. The radio button label.
#' @param choices Named vector. The option names and underyling values.
#' @param color String. The color of the radio buttons. Leave empty for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors. \emph{This input requires using color hex codes, rather than the word form. E.g., "#ef5350", rather than "red lighten-1".}
#' @examples
#' material_radio_button(
#'   inputId = "example_radio_button",
#'   label = "Radio Button",
#'   choices = c(
#'     "Cake" = "c",
#'     "Pie" = "p",
#'     "Brownie" = "b"
#'   ),
#'   color = "#ef5350"
#' )
material_radio_button <- function(inputId, label, choices, color = NULL) {

  if(!is.null(color)){

    radio_button_style <-
      shiny::tagList(
        shiny::tags$head(
          shiny::tags$style(
            paste0(
              '
              input[type="radio"].shinymaterial-radio-button-', inputId,':checked+label:before,
              input[type="radio"].shinymaterial-radio-button-', inputId,':checked+label:after {
              border: 2px solid ', color, ' !important;
              }

              input[type="radio"].shinymaterial-radio-button-', inputId,':checked+label:after {
              background-color: ', color, ' !important;
              }
              '
            )
          )
        )
      )

  } else {
    radio_button_style <- shiny::tags$div()
  }

  material_radio_choices <- shiny::tagList()

  has_names <- !is.null(names(choices))

  for(i in 1:length(choices)){
    material_radio_choices[[i]] <-
      shiny::tags$p(
        shiny::tags$input(
          type = "radio",
          name = inputId,
          class =
            ifelse(
              is.null(color),
              '',
              paste0('shinymaterial-radio-button-', inputId)
            ),
          id = ifelse(choices[i] != "", choices[i], "_shinymaterialradioempty_")
        ),
        shiny::tags$label(
          `for` = ifelse(choices[i] != "", choices[i], "_shinymaterialradioempty_"),
          ifelse(
            has_names,
            names(choices[i]),
            choices[i]
          )
        )
      )
  }

  create_material_object(
    js_file =
      "shiny-material-radio-button.js",
    material_tag_list =
      shiny::tagList(
        shiny::tags$form(
          action = "#",
          id = inputId,
          shiny::tags$label(
            `for` = inputId,
            label
          ),
          material_radio_choices,
          class = "shiny-material-radio-button"
        ),
        radio_button_style
      )
  )
}
