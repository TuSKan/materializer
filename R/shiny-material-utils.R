default_color <- "#26a69a"

ifDef <- function(param, prefix = "") {
  if (is.null(param) || param == FALSE) return("")
  sapply(param, function(x) paste0(prefix, x))
}

css.names <- function(x) gsub("[ ]|[.]|[_]", "-", x)

isEmpty <- function(x) is.null(x) || length(x) == 0

clean <- function(x) x[!vapply(x, isEmpty, FUN.VALUE = logical(1))]

cleanList <- function(...) clean(list(...))

includeInHead <- function(..., style = NULL, script = NULL, package = "shinymaterial") {
  files <- list(...)
  shiny::tagList(
    if (!isEmpty(files)) {
      shiny::singleton(
        shiny::tags$head(
          lapply(files, function(f) {
            switch(
              tolower(tools::file_ext(f)),
              "css" = shiny::includeCSS(
                system.file(
                  file.path("css", f),
                  package = package
                )
              ),
              "js" = shiny::includeScript(
                system.file(
                  file.path("js", f),
                  package = package
                )
              ),
              "html" = shiny::includeHTML(
                system.file(
                  file.path("html", f),
                  package = package
                )
              ),
              "txt" = shiny::includeText(
                system.file(
                  file.path("txt", f),
                  package = package
                )
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
}

fontsCopy <- function() {
  font_dirs <- file.path("www/fonts", list.dirs(system.file("materialize/fonts", package = "shinymaterial"), full.names = FALSE, recursive = TRUE))

  for (d in font_dirs) {
    if (!dir.exists(d)) {
      message(
        paste0(
          "[shinymaterial] Creating directory: ",
          file.path(getwd(), d)
        )
      )
      dir.create(d, recursive = TRUE)
    }
  }

  font_files <- list.files(system.file("materialize/fonts", package = "shinymaterial"), recursive = TRUE)

  for (f in font_files) {
    file.copy(
      from = file.path(system.file("materialize/fonts", package = "shinymaterial"), f),
      to = file.path("www/fonts", f),
      overwrite = TRUE
    )
  }
}

material_colormap <- function(c) {
  if (is.null(c)) return("")
  switch(c,
    "#ffebee" = "red lighten-5",
    "#ffcdd2" = "red lighten-4",
    "#ef9a9a" = "red lighten-3",
    "#e57373" = "red lighten-2",
    "#ef5350" = "red lighten-1",
    "#f44336" = "red",
    "#e53935" = "red darken-1",
    "#d32f2f" = "red darken-2",
    "#c62828" = "red darken-3",
    "#b71c1c" = "red darken-4",
    "#ff8a80" = "red accent-1",
    "#ff5252" = "red accent-2",
    "#ff1744" = "red accent-3",
    "#d50000" = "red accent-4",
    "#fce4ec" = "pink lighten-5",
    "#f8bbd0" = "pink lighten-4",
    "#f48fb1" = "pink lighten-3",
    "#f06292" = "pink lighten-2",
    "#ec407a" = "pink lighten-1",
    "#e91e63" = "pink",
    "#d81b60" = "pink darken-1",
    "#c2185b" = "pink darken-2",
    "#ad1457" = "pink darken-3",
    "#880e4f" = "pink darken-4",
    "#ff80ab" = "pink accent-1",
    "#ff4081" = "pink accent-2",
    "#f50057" = "pink accent-3",
    "#c51162" = "pink accent-4",
    "#f3e5f5" = "purple lighten-5",
    "#e1bee7" = "purple lighten-4",
    "#ce93d8" = "purple lighten-3",
    "#ba68c8" = "purple lighten-2",
    "#ab47bc" = "purple lighten-1",
    "#9c27b0" = "purple",
    "#8e24aa" = "purple darken-1",
    "#7b1fa2" = "purple darken-2",
    "#6a1b9a" = "purple darken-3",
    "#4a148c" = "purple darken-4",
    "#ea80fc" = "purple accent-1",
    "#e040fb" = "purple accent-2",
    "#d500f9" = "purple accent-3",
    "#aa00ff" = "purple accent-4",
    "#ede7f6" = "deep-purple lighten-5",
    "#d1c4e9" = "deep-purple lighten-4",
    "#b39ddb" = "deep-purple lighten-3",
    "#9575cd" = "deep-purple lighten-2",
    "#7e57c2" = "deep-purple lighten-1",
    "#673ab7" = "deep-purple",
    "#5e35b1" = "deep-purple darken-1",
    "#512da8" = "deep-purple darken-2",
    "#4527a0" = "deep-purple darken-3",
    "#311b92" = "deep-purple darken-4",
    "#b388ff" = "deep-purple accent-1",
    "#7c4dff" = "deep-purple accent-2",
    "#651fff" = "deep-purple accent-3",
    "#6200ea" = "deep-purple accent-4",
    "#e8eaf6" = "indigo lighten-5",
    "#c5cae9" = "indigo lighten-4",
    "#9fa8da" = "indigo lighten-3",
    "#7986cb" = "indigo lighten-2",
    "#5c6bc0" = "indigo lighten-1",
    "#3f51b5" = "indigo",
    "#3949ab" = "indigo darken-1",
    "#303f9f" = "indigo darken-2",
    "#283593" = "indigo darken-3",
    "#1a237e" = "indigo darken-4",
    "#8c9eff" = "indigo accent-1",
    "#536dfe" = "indigo accent-2",
    "#3d5afe" = "indigo accent-3",
    "#304ffe" = "indigo accent-4",
    "#e3f2fd" = "blue lighten-5",
    "#bbdefb" = "blue lighten-4",
    "#90caf9" = "blue lighten-3",
    "#64b5f6" = "blue lighten-2",
    "#42a5f5" = "blue lighten-1",
    "#2196f3" = "blue",
    "#1e88e5" = "blue darken-1",
    "#1976d2" = "blue darken-2",
    "#1565c0" = "blue darken-3",
    "#0d47a1" = "blue darken-4",
    "#82b1ff" = "blue accent-1",
    "#448aff" = "blue accent-2",
    "#2979ff" = "blue accent-3",
    "#2962ff" = "blue accent-4",
    "#e1f5fe" = "light-blue lighten-5",
    "#b3e5fc" = "light-blue lighten-4",
    "#81d4fa" = "light-blue lighten-3",
    "#4fc3f7" = "light-blue lighten-2",
    "#29b6f6" = "light-blue lighten-1",
    "#03a9f4" = "light-blue",
    "#039be5" = "light-blue darken-1",
    "#0288d1" = "light-blue darken-2",
    "#0277bd" = "light-blue darken-3",
    "#01579b" = "light-blue darken-4",
    "#80d8ff" = "light-blue accent-1",
    "#40c4ff" = "light-blue accent-2",
    "#00b0ff" = "light-blue accent-3",
    "#0091ea" = "light-blue accent-4",
    "#e0f7fa" = "cyan lighten-5",
    "#b2ebf2" = "cyan lighten-4",
    "#80deea" = "cyan lighten-3",
    "#4dd0e1" = "cyan lighten-2",
    "#26c6da" = "cyan lighten-1",
    "#00bcd4" = "cyan",
    "#00acc1" = "cyan darken-1",
    "#0097a7" = "cyan darken-2",
    "#00838f" = "cyan darken-3",
    "#006064" = "cyan darken-4",
    "#84ffff" = "cyan accent-1",
    "#18ffff" = "cyan accent-2",
    "#00e5ff" = "cyan accent-3",
    "#00b8d4" = "cyan accent-4",
    "#e0f2f1" = "teal lighten-5",
    "#b2dfdb" = "teal lighten-4",
    "#80cbc4" = "teal lighten-3",
    "#4db6ac" = "teal lighten-2",
    "#26a69a" = "teal lighten-1",
    "#009688" = "teal",
    "#00897b" = "teal darken-1",
    "#00796b" = "teal darken-2",
    "#00695c" = "teal darken-3",
    "#004d40" = "teal darken-4",
    "#a7ffeb" = "teal accent-1",
    "#64ffda" = "teal accent-2",
    "#1de9b6" = "teal accent-3",
    "#00bfa5" = "teal accent-4",
    "#e8f5e9" = "green lighten-5",
    "#c8e6c9" = "green lighten-4",
    "#a5d6a7" = "green lighten-3",
    "#81c784" = "green lighten-2",
    "#66bb6a" = "green lighten-1",
    "#4caf50" = "green",
    "#43a047" = "green darken-1",
    "#388e3c" = "green darken-2",
    "#2e7d32" = "green darken-3",
    "#1b5e20" = "green darken-4",
    "#b9f6ca" = "green accent-1",
    "#69f0ae" = "green accent-2",
    "#00e676" = "green accent-3",
    "#00c853" = "green accent-4",
    "#f1f8e9" = "light-green lighten-5",
    "#dcedc8" = "light-green lighten-4",
    "#c5e1a5" = "light-green lighten-3",
    "#aed581" = "light-green lighten-2",
    "#9ccc65" = "light-green lighten-1",
    "#8bc34a" = "light-green",
    "#7cb342" = "light-green darken-1",
    "#689f38" = "light-green darken-2",
    "#558b2f" = "light-green darken-3",
    "#33691e" = "light-green darken-4",
    "#ccff90" = "light-green accent-1",
    "#b2ff59" = "light-green accent-2",
    "#76ff03" = "light-green accent-3",
    "#64dd17" = "light-green accent-4",
    "#f9fbe7" = "lime lighten-5",
    "#f0f4c3" = "lime lighten-4",
    "#e6ee9c" = "lime lighten-3",
    "#dce775" = "lime lighten-2",
    "#d4e157" = "lime lighten-1",
    "#cddc39" = "lime",
    "#c0ca33" = "lime darken-1",
    "#afb42b" = "lime darken-2",
    "#9e9d24" = "lime darken-3",
    "#827717" = "lime darken-4",
    "#f4ff81" = "lime accent-1",
    "#eeff41" = "lime accent-2",
    "#c6ff00" = "lime accent-3",
    "#aeea00" = "lime accent-4",
    "#fffde7" = "yellow lighten-5",
    "#fff9c4" = "yellow lighten-4",
    "#fff59d" = "yellow lighten-3",
    "#fff176" = "yellow lighten-2",
    "#ffee58" = "yellow lighten-1",
    "#ffeb3b" = "yellow",
    "#fdd835" = "yellow darken-1",
    "#fbc02d" = "yellow darken-2",
    "#f9a825" = "yellow darken-3",
    "#f57f17" = "yellow darken-4",
    "#ffff8d" = "yellow accent-1",
    "#ffff00" = "yellow accent-2",
    "#ffea00" = "yellow accent-3",
    "#ffd600" = "yellow accent-4",
    "#fff8e1" = "amber lighten-5",
    "#ffecb3" = "amber lighten-4",
    "#ffe082" = "amber lighten-3",
    "#ffd54f" = "amber lighten-2",
    "#ffca28" = "amber lighten-1",
    "#ffc107" = "amber",
    "#ffb300" = "amber darken-1",
    "#ffa000" = "amber darken-2",
    "#ff8f00" = "amber darken-3",
    "#ff6f00" = "amber darken-4",
    "#ffe57f" = "amber accent-1",
    "#ffd740" = "amber accent-2",
    "#ffc400" = "amber accent-3",
    "#ffab00" = "amber accent-4",
    "#fff3e0" = "orange lighten-5",
    "#ffe0b2" = "orange lighten-4",
    "#ffcc80" = "orange lighten-3",
    "#ffb74d" = "orange lighten-2",
    "#ffa726" = "orange lighten-1",
    "#ff9800" = "orange",
    "#fb8c00" = "orange darken-1",
    "#f57c00" = "orange darken-2",
    "#ef6c00" = "orange darken-3",
    "#e65100" = "orange darken-4",
    "#ffd180" = "orange accent-1",
    "#ffab40" = "orange accent-2",
    "#ff9100" = "orange accent-3",
    "#ff6d00" = "orange accent-4",
    "#fbe9e7" = "deep-orange lighten-5",
    "#ffccbc" = "deep-orange lighten-4",
    "#ffab91" = "deep-orange lighten-3",
    "#ff8a65" = "deep-orange lighten-2",
    "#ff7043" = "deep-orange lighten-1",
    "#ff5722" = "deep-orange",
    "#f4511e" = "deep-orange darken-1",
    "#e64a19" = "deep-orange darken-2",
    "#d84315" = "deep-orange darken-3",
    "#bf360c" = "deep-orange darken-4",
    "#ff9e80" = "deep-orange accent-1",
    "#ff6e40" = "deep-orange accent-2",
    "#ff3d00" = "deep-orange accent-3",
    "#dd2c00" = "deep-orange accent-4",
    "#efebe9" = "brown lighten-5",
    "#d7ccc8" = "brown lighten-4",
    "#bcaaa4" = "brown lighten-3",
    "#a1887f" = "brown lighten-2",
    "#8d6e63" = "brown lighten-1",
    "#795548" = "brown",
    "#6d4c41" = "brown darken-1",
    "#5d4037" = "brown darken-2",
    "#4e342e" = "brown darken-3",
    "#3e2723" = "brown darken-4",
    "#fafafa" = "grey lighten-5",
    "#f5f5f5" = "grey lighten-4",
    "#eeeeee" = "grey lighten-3",
    "#e0e0e0" = "grey lighten-2",
    "#bdbdbd" = "grey lighten-1",
    "#9e9e9e" = "grey",
    "#757575" = "grey darken-1",
    "#616161" = "grey darken-2",
    "#424242" = "grey darken-3",
    "#212121" = "grey darken-4",
    "#eceff1" = "blue-grey lighten-5",
    "#cfd8dc" = "blue-grey lighten-4",
    "#b0bec5" = "blue-grey lighten-3",
    "#90a4ae" = "blue-grey lighten-2",
    "#78909c" = "blue-grey lighten-1",
    "#607d8b" = "blue-grey",
    "#546e7a" = "blue-grey darken-1",
    "#455a64" = "blue-grey darken-2",
    "#37474f" = "blue-grey darken-3",
    "#263238" = "blue-grey darken-4",
    "#000000" = "black",
    "#ffffff" = "white",
    ""
  )
}
