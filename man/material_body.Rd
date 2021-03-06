% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/materialize-body.R
\name{material_body}
\alias{material_body}
\title{Create a materialize body}
\usage{
material_body(..., title = "", footer = NULL,
  bgcolor = "grey lighten-4", fontcolor = NULL, offline = FALSE)
}
\arguments{
\item{...}{The UI elements to place in the body}

\item{title}{String. The title of the body}

\item{footer}{tagList. The footer of the body}

\item{bgcolor}{Body background color. Leave blank for "grey lighten-4" color. Visit \url{http://materializecss.com/color.html} for a list of available colors.}

\item{fontcolor}{String. The title font color. Leave blank for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors.}

\item{offline}{Boolean. Should the material font files be offline? (This will place the font sources in a directory 'www', at the same location as the app code.)}
}
\description{
Build a materialize body
}
\examples{
require(materializer)
material_body(
  title = "Example Title",
  bgcolor = "blue lighten-4",
  shiny::tags$h1("Body Content")
)
}
