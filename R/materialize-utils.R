

default_color <- "teal lighten-1"

.onLoad <- function(...) {
  shiny::addResourcePath('materializer', system.file('materializer', package = 'materializer'))
}

ifDef <- function(param, prefix = "", suffix = "") {
  if (is.null(param) || param == FALSE || is.na(param)) return("")
  sapply(param, function(x) paste0(prefix, x, suffix))
}

colortext <- function(color) {
  res <- sub(" ", "-text.text-",color)
  if (sum(!grepl("text",res)) > 0 )
    res <- paste0(res, "-text")
  res
}

css.names <- function(x) gsub("[ ]|[.]|[_]", "-", x)

isEmpty <- function(x) is.null(x) || length(x) == 0

clean <- function(x) x[!vapply(x, isEmpty, FUN.VALUE = logical(1))]

cleanList <- function(...) clean(list(...))

hex2rgb <- function(hexcol) {
  if (substr(hexcol,1,1) != "#") return(stats::setNames(c(0,0,0,1), c("r","g","b","a")))
  stats::setNames(strtoi(c(substr(hexcol,2,3),substr(hexcol,4,5),substr(hexcol,6,7)), 16), c("r","g","b"))
}

includeInHead <- function(..., style = NULL, script = NULL, package = "materializer") {
  files <- clean(list(...))
  clean(
    shiny::tagList(
      if (!isEmpty(files)) {
        shiny::singleton(
          shiny::tags$head(
            lapply(files, function(f) {
              switch(
                tolower(tools::file_ext(f)),
                "css" = shiny::tags$link(
                  type = "text/css",
                  rel = "stylesheet",
                  href = file.path("materializer/css", f)
                ),
                "js" = shiny::tags$script(
                  src = file.path("materializer/js", f)
                ),
                "html" = shiny::includeHTML(
                  file.path("materializer/html", f)
                ),
                "txt" = shiny::includeText(
                  file.path("materializer/txt", f)
                )
              )
            })
          )
        )
      },
      if (!is.null(style)) {
        shiny::tags$head(
          shiny::tags$style(
            style
          )
        )
      },
      if (!is.null(script)) {
        shiny::tags$head(
          shiny::tags$script(
            script
          )
        )
      }
    )
  )
}

fontsCopy <- function() {
  font_dirs <- file.path("www/fonts", list.dirs(system.file("fonts", package = "materializer"), full.names = FALSE, recursive = TRUE))

  for (d in font_dirs) {
    if (!dir.exists(d)) {
      message(
        paste0(
          "[materializer] Creating directory: ",
          file.path(getwd(), d)
        )
      )
      dir.create(d, recursive = TRUE)
    }
  }

  font_files <- list.files(system.file("fonts", package = "materializer"), recursive = TRUE)

  for (f in font_files) {
    file.copy(
      from = file.path(system.file("fonts", package = "materializer"), f),
      to = file.path("www/fonts", f),
      overwrite = TRUE
    )
  }
}



