#' hidden aliases
#' @name hidden_aliases
NULL
setClassUnion("missingOrNULL", c("missing", "NULL"))


#' sql_values
#'
#' A function to generate SQL value lists, to be used with sql values keyword:
#'   "\code{VALUES (1,2), (1,3), (2,7)}".
#'
#' @param conn A database connection.
#' @param x a vector or data.frame like
#' @param ... additional parameters passed through to methods (currently not
#'   used by standard methods)
#' @param val_sep a string to be put between SQL values in addition to ","
#'
#' @return an object of type SQL
#'
#' @export
#' @import DBI
#'
#' @examples
#'
#' #' # SQL VALUES list from vector
#' sql_values(letters)
#' sql_values(4L:7L)
#' sql_values(1.3:7.1)
#' sql_values(rep(Sys.time(), 10))
#'
#' # SQL VALUES list from data.frame like
#' sql_values(data.frame(letters, seq_along(letters), Sys.time()))
#' sql_values(data.frame(letters, seq_along(letters), Sys.time()), conn = DBI::ANSI())
#'
#'
setGeneric(
  name = "sql_values",
  def  = function(x, ..., val_sep = "\n", conn = NULL) standardGeneric("sql_values")
)

#' @rdname hidden_aliases
#' @export
#' @import DBI
setMethod(
  f          = "sql_values",
  signature  =
    signature(
      x    = "ANY",
      conn = "missingOrNULL"
    ),

  definition =
    function(x, ..., val_sep = "\n", conn = NULL) {

      # use default ANSI connection
      conn = DBI::ANSI()

      # call generic again
      callGeneric(x = x, ..., val_sep = val_sep, conn = conn)
    }
)


#' @rdname hidden_aliases
#' @export
#' @import DBI
setMethod(
  f          = "sql_values",
  signature(
    x    = "vector",
    conn = "DBIConnection"
  ),

  definition =
    function(x, ..., val_sep = "\n", conn = NULL) {
      DBI::SQL(
        paste0(
          "(",
          DBI::dbQuoteLiteral(conn = conn, x = x),
          ")",
          collapse = paste0(", ", val_sep)
        )
      )
    }
)


#' @rdname hidden_aliases
#' @export
setMethod(
  f          = "sql_values",
  signature  =
    signature(
      x    = "data.frame",
      conn = "DBIConnection"
    ),

  definition =
    function(x, ..., val_sep = "\n", conn = NULL) {

      # no data, no sql values
      stopifnot( nrow(x) > 0 )

      # prepare basic call
      sql_values_call <- call("paste0", "(")

      # extend call for each column
      for ( xcol in seq_len(ncol(x)) ) {
        if ( xcol == 1 ){
          # do nothing
        } else {
          # add colon
          sql_values_call[[length(sql_values_call) + 1]] <- ", "
        }

        # add excaped column
        sql_values_call[[length(sql_values_call) + 1]] <-
          DBI::dbQuoteLiteral(conn = conn, x = x[[xcol]])
      }

      sql_values_call[[length(sql_values_call) + 1]] <- ")"

      # run function call
      value_items <- eval(sql_values_call)

      # collapse into single string and return
      DBI::SQL(
        paste0(
          value_items,
          collapse = paste0(", ", val_sep)
        )
      )
    }
)
























