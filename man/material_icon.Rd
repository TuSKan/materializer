% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/materialize-icon.R
\name{material_icon}
\alias{material_icon}
\title{Material Icon}
\usage{
material_icon(icon, align = NULL, size = NULL, class = NULL,
  color = NULL, ...)
}
\arguments{
\item{icon}{String. The name of the icon. Leave empty for no icon. Visit \url{http://materializecss.com/icons.html} for a list of available icons.}

\item{align}{String The icon align. Values should be 'left', 'right', and 'center'}

\item{size}{String. Size of icon, could be 'tiny' (1rem), 'small' (2rem), 'medium' (4rem) and 'large' (6rem).}

\item{class}{String. Aditional class to icon}

\item{color}{String. The color name for links and icons in Sidenav Leave empty for the 'teal lighten-1' color. Visit \url{http://materializecss.com/color.html} for a list of available colors.}

\item{...}{tagList. Any additional tag list}
}
\description{
Createa material Icon element
}
\examples{
require(materializer)
material_icon(icon = "cloud")
}
