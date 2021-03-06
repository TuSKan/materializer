% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/materialize-grid.R
\name{material_column}
\alias{material_column}
\title{Create a column to organize UI content}
\usage{
material_column(..., width = 6, type = "s", offset = NULL)
}
\arguments{
\item{...}{The UI elements to place in the column.}

\item{width}{Integer. The width of the column. The value should be between 1 and 12.}

\item{type}{Char. Type of column responsive. The value should be s (default), m or l.}

\item{offset}{Integer. The offset to the left of the column. The value should be between 0 and 11.}
}
\description{
UI content can be placed in columns to organize items on a page.
}
\examples{
require(materializer)
material_column(
  width = 4,
  shiny::h1("Column Content")
)
}
