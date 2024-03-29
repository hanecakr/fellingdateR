% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_fh.R
\name{read_fh}
\alias{read_fh}
\title{Read a Heidelberg format (.fh) tree-ring file}
\usage{
read_fh(fname, BC_correction = FALSE, verbose = TRUE, header = FALSE)
}
\arguments{
\item{fname}{A \code{character} vector specifying the name of the .fh file to
read.}

\item{BC_correction}{A \code{logical}. If \code{TRUE} the correction moves BC-dates one
year forward.}

\item{verbose}{A \code{logical}. If \code{FALSE}, messages are suppressed during the
reading process.}

\item{header}{A \code{logical}. If \code{TRUE} the HEADER fields are returned as a
\code{data.frame}; if \code{FALSE}, the measurement data is returned.}
}
\value{
If \code{header} is TRUE, a data.frame is returned with HEADER fields as
attributes. If \code{header} is FALSE, a \code{data.frame} of class \code{rwl} with
ring-width measurements in columns is returned, with (calendar) years as
row names.`
}
\description{
This function reads a Heidelberg format file (.fh) containing
ring width data and returns the HEADER fields as attributes of the
\code{data.frame}´with the measurement data.

The Heidelberg file format is described in detail here:
https://www.treeringsociety.org/resources/SOM/Brewer_Murphy_SupplementaryMaterial.pdf
}
\details{
This function reads .fh file with ring width data in either block
(decadal format) or column format (e.g., with comment flags) as used by
TSAP program. The function is also capable of reading chronologies or
half-chronos in decadal format. The \code{read_fh} function is case-insensitive.
Information found in the HEADER fields is listed as attributes of the
\code{data.frame}´with the measurement data. .

The header fields harvested from the .fh file include:

"Project", "FirstMeasurementDate", "Location", "Town", "Street", "Client",
"Longitude", "Latitude", "DateOfSampling", "FirstMeasurementDate",
"SapWoodRings", "Comment", "MissingRingsAfter", "InvalidRingsAfter",
"MissingringsBefore", "DeltaMissingringsBefore", "ChronoMemberKeycodes",
"PersId"
}
\examples{
Doel1 <- system.file("extdata", "DOEL1.fh", package = "fellingdater")
Doel1_trs <- read_fh(Doel1, verbose = FALSE)
head(Doel1_trs, 10)

Doel1_header <- read_fh(Doel1, verbose = FALSE, header = TRUE)
Doel1_header

}
\references{
This function is an extension of \code{read.fh()} from the \strong{dplR
package} (\url{https://github.com/opendendro/dplR}), developed and maintained
by Prof. dr. Andy Bunn (Bunn 2008, Bunn 2010, Bunn et al. 2022) on
\url{https://opendendro.org/}.
}
\author{
The original \code{read.fh()} function is part of the \strong{dplR package}
(\url{https://github.com/opendendro/dplR}) and was developed by Christian Zang,
with new features and patches contributed by Mikko Korpela and Ronald
Visser. This \code{read_fh()} function expands the functionalities of the
original \code{\link[dplR:read.fh]{dplR::read.fh()}}.
}
