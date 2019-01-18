#' Create a materialize meter
#'
#' Build a materialize rating
#' @param inputId String. The input identifier used to access the value.
#' @param value Double. A floating point number that represents the current value of the measured range. This must be between the min and the max value (if specified).
#' @param min Double Indicates the lower bound of the measured range. This must be less than the max value (if specified). If unspecified, the minimum value is 0.
#' @param max Double. Indicates the upper bound of the measured range. This must be greater than the min value (if specified). If unspecified, the maximum value is 1.0.
#' @param high Double. It represents the lower bound of the high end of the measured range. This must be less than the max attribute, but greater than the low and min value (if specified). If unspecified, or if greater than the max value, the high value is equal to the max value.
#' @param low Double. It represents the upper bound of the low end of the measured range. This must be greater than the min attribute, but less than the high and max value (if specified). If unspecified, or if less than the minimum value, the low value is equal to the min value.
#' @param optimum Double. This attribute indicates the optimum value and must be within the range of min and max values. When used with the low and high attribute, it indicates the preferred zone for a given range.
#' @param width String. The width of the meter. Could be any css length.
#' @param height String. Could be any css length
#' @param ... tagList. Aditional arguments
#' @examples
#' require(materializer)
#' material_meter(
#'   inputId = "examplemeter",
#'   value = 0.5,
#'   min = 0,
#'   max = 1
#' )
#' @export

material_meter <- function(inputId, value = 0.5, min = 0.0, max = 1.0, high = 0.8, low = 0.2, optimum = 0.5, width = "5em", height = "1em", ...) {
  shiny::tags$meter(
    id = inputId,
    class = paste("materialize-meter", "meter"),
    value = value,
    min = min,
    max = max,
    high = high,
    low = low,
    ...,
    optimum = optimum,
    includeInHead(
      "materialize-meter.js",
      "materialize-meter.css",
      style = paste0('meter { width: ', width, '; height: ', height,';}')
    )
  )
}


#' @rdname material_meter
#' @param session Shiny default reactive domain.
#' @export
update_material_meter <- function(inputId, value = NULL, min = NULL, max = NULL, high = NULL, low = NULL, optimum = NULL, session = shiny::getDefaultReactiveDomain()) {
  session$sendInputMessage(
    inputId,
    cleanList(
      value = value,
      min = min,
      max = max,
      high = high,
      low = low,
      optimum = optimum
    )
  )
}
