#' Create a materialize text box
#'
#' Build a materialize text input
#' @param inputId String. The input identifier used to access the value.
#' @param label String. The text input label.
#' @param placeholder String. The placeholder of the text input
#' @param inline Logical. The text input should be inline with others elements?. Value should be TRUE or FALSE
#' @param readonly Logical. The text input should be read-only?. Value should be TRUE or FALSE
#' @param help String. The helper text below text input.
#' @param type String. The type of the text input. Valiue should be text, number, email, password, time, date
#' @param class String. Additional class for text input.
#' @param icon String. The name of the icon. Leave empty for no icon. Visit \url{http://materializecss.com/icons.html} for a list of available icons.
#' @param color String. The color name of the text input. Leave empty for 'teal lighten-1' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param error String. Validate mensage when is not valid
#' @param success String. Validate mensage when is  valid
#' @param value String or Numeric. The value to update the input.
#' @param session Shiny default reactive domain.
#' @examples
#' require(materializer)
#' material_text(
#'   inputId = "example_text",
#'   label = "Label",
#'   color = 'teal lighten-1'
#' )
#' @export
material_text <- function(inputId, label, placeholder = NULL, inline = FALSE, readonly = FALSE, help = NULL, type = "text", class = NULL, icon = NULL, color = NULL, error = "wrong", success = "valid") {

  if (is.null(color)) color <- default_color
  colornm <- css.names(color)
  colorhex <- material_colormap(color)

  fileIncl <- "text"
  typeInput <- type
  if (type %in% c("date","time")) {
    fileIncl <- type
    class <- c(class,paste0(type, "picker"))
    typeInput <- "text"
  }

  shiny::tags$div(
    class = paste("input-field", if (inline) "inline", paste0("text-", colornm)),
    if (!is.null(icon)) {
      shiny::tags$i(
        class = "material-icons prefix",
        icon
      )
    },
    shiny::tags$input(
      disable = if (readonly) NA,
      id = inputId,
      placeholder = placeholder,
      type = typeInput,
      class = paste("validate", class, "materialize-text")
    ),
    shiny::tags$label(
      "for" = inputId,
      label
    ),
    if (!is.null(help)) {
      shiny::tags$span(
        class = "helper-text",
        "data-error" = error,
        "data-success" = success,
        help
      )
    },
    includeInHead(
      paste0("materialize-",fileIncl,".js"),
      paste0("materialize-text.css"),
      style = paste0(
      '/* label focus color */
        .text-', colornm,' input[type=',typeInput,']:not(.browser-default):focus:not([readonly]) + label {
          color: ', colorhex,';
        }
      /* label underline focus color */
        .text-', colornm,' input[type=',typeInput,']:not(.browser-default):focus:not([readonly]) {
          border-bottom: 1px solid ', colorhex,';
          box-shadow: 0 1px 0 0 ', colorhex,';
        }
      /* label underline valid color */
          .text-', colornm,' input[type=',typeInput,'].valid:not(.browser-default) {
          border-bottom: 1px solid ', colorhex,';
          box-shadow: 0 1px 0 0 ', colorhex,';
      }
      /* icon prefix focus color */
        .text-', colornm,' .prefix.active {
          color: ', colorhex,';
        }
        /* time modal */
        .timepicker-digital-display {
          background-color: ', colorhex,' !important;
        }
        .timepicker-close {
          color: ', colorhex,' !important;
        }
        .timepicker-tick.active, .timepicker-tick:hover {
          background-color: rgba(', paste(hex2rgb(colorhex),collapse = ","),',0.25) !important;
        }
        .timepicker-tick.active, .timepicker-tick:hover {
         background-color: rgba(', paste(hex2rgb(colorhex),collapse = ","),',0.25) !important;
        }
        .timepicker-canvas line {
         stroke: ', colorhex,' !important;
        }
        .timepicker-canvas-bearing {
         fill: ', colorhex,' !important;
        }
        .timepicker-canvas-bg {
         fill: ', colorhex,' !important;
        }
        .datepicker-date-display {
         background-color: ', colorhex,' !important;
        }
        .datepicker-cancel,
        .datepicker-clear,
        .datepicker-today,
        .datepicker-done{
          color: ', colorhex,' !important;
        }
        .datepicker-table td.is-today {
          color: ', colorhex,' !important;
        }
        .datepicker-table td.is-selected {
         background-color: ', colorhex,' !important;
        }
        .datepicker-day-button:focus {
          background-color: rgba(', paste(hex2rgb(colorhex),collapse = ","),',0.25) !important;
        }'
      )
    )
  )

}


#' @rdname material_text
#' @export
material_number <- function(inputId, label, placeholder = NULL, inline = FALSE, readonly = FALSE, help = NULL, class = NULL, icon = NULL, color = NULL) {
  material_text(inputId = inputId, label = label, placeholder = placeholder, inline = inline, readonly = readonly, help = help, type = "number", class = class, icon = icon, color = color)
}

#' @rdname material_text
#' @export
material_email <- function(inputId, label, placeholder = NULL, inline = FALSE, readonly = FALSE, help = NULL, class = NULL, icon = NULL, color = NULL) {
  material_text(inputId = inputId, label = label, placeholder = placeholder, inline = inline, readonly = readonly, help = help, type = "email", class = class, icon = icon, color = color)
}

#' @rdname material_text
#' @export
material_password <- function(inputId, label, placeholder = NULL, inline = FALSE, readonly = FALSE, help = NULL, class = NULL, icon = NULL, color = NULL) {
  material_text(inputId = inputId, label = label, placeholder = placeholder, inline = inline, readonly = readonly, help = help, type = "password", class = class, icon = icon, color = color)
}

#' @rdname material_text
#' @export
material_date <- function(inputId, label, placeholder = NULL, inline = FALSE, readonly = FALSE, help = NULL, class = NULL, icon = NULL, color = NULL) {
  material_text(inputId = inputId, label = label, placeholder = placeholder, inline = inline, readonly = readonly, help = help, type = "date", class = class, icon = icon, color = color)
}

#' @rdname material_text
#' @export
material_time <- function(inputId, label, placeholder = NULL, inline = FALSE, readonly = FALSE, help = NULL, class = NULL, icon = NULL, color = NULL) {
  material_text(inputId = inputId, label = label, placeholder = placeholder, inline = inline, readonly = readonly, help = help, type = "time", class = class, icon = icon, color = color)
}

#### Update ####

#' @rdname material_text
#' @export
update_material_text <- function(inputId, value = NULL, label = NULL, placeholder = NULL, readonly = NULL, help = NULL, session = shiny::getDefaultReactiveDomain()) {
  session$sendInputMessage(
      inputId,
    cleanList(
      value = value,
      label = label,
      placeholder = placeholder,
      readonly = readonly,
      help = help
    )
  )
}

#' @rdname material_text
#' @export
update_material_number <- function(inputId, value = NULL, label = NULL, placeholder = NULL, readonly = FALSE, help = NULL, session = shiny::getDefaultReactiveDomain()) {
  update_material_text(inputId = inputId, value = value, label = label, placeholder = placeholder, readonly = readonly, help = help, session = session)
}

#' @rdname material_text
#' @export
update_material_email <- function(inputId, value = NULL, label = NULL, placeholder = NULL, readonly = FALSE, help = NULL, session = shiny::getDefaultReactiveDomain()) {
  update_material_text(inputId = inputId, value = value,label = label, placeholder = placeholder, readonly = readonly, help = help, session = session)
}

#' @rdname material_text
#' @export
update_material_password <- function(inputId, value = NULL, label = NULL, placeholder = NULL, readonly = FALSE, help = NULL, session = shiny::getDefaultReactiveDomain()) {
  update_material_text(inputId = inputId, value = value,label = label, placeholder = placeholder, readonly = readonly, help = help, session = session)
}

#' @rdname material_text
#' @export
update_material_date <- function(inputId, value = NULL, label = NULL, placeholder = NULL, readonly = FALSE, help = NULL, session = shiny::getDefaultReactiveDomain()) {
  update_material_text(inputId = inputId, value = value,label = label, placeholder = placeholder, readonly = readonly, help = help, session = session)
}
