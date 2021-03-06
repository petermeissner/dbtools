% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sqlValues.R
\name{sqlValues}
\alias{sqlValues}
\title{sqlValues}
\usage{
sqlValues(x, ..., val_sep = "\\n", conn = NULL)
}
\arguments{
\item{x}{a vector or data.frame like}

\item{...}{additional parameters passed through to methods (currently not
used by standard methods)}

\item{val_sep}{a string to be put between SQL values in addition to ","}

\item{conn}{A database connection.}
}
\value{
an object of type SQL
}
\description{
A function to generate SQL value lists, to be used with sql values keyword:
  "\code{VALUES (1,2), (1,3), (2,7)}".
}
\examples{

#' # SQL VALUES list from vector
sqlValues(ANSI(), letters)
sqlValues(ANSI(), 4L:7L)
sqlValues(ANSI(), 1.3:7.1)
sqlValues(ANSI(), rep(Sys.time(), 10))

# SQL VALUES list from data.frame like
sqlValues(ANSI(), data.frame(letters, seq_along(letters), Sys.time()))


}
