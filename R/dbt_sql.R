#' dbt_sql
#'
#'
#' @param query_string a (character) vector or SQL to be either marked as SQL or
#'     to be interpolated.
#' @param ... optional furtherarguments used to interpolate values into
#'     query_string
#'
#' @return an object of type SQL
#'
#' @export
#'
#'
#'
setGeneric(
  name = "dbt_sql",
  def  = function(query_string, ...) standardGeneric("dbt_sql")
)




#' @rdname hidden_aliases
#' @export
setMethod(
  f          = "dbt_sql",
  signature  =
    signature(
      query_string = "ANY"
    ),

  definition =
    function(query_string, ...) {
      # paste together string, mark as SQL and return
      DBI::SQL(glue::glue(query_string, ...))
    }
)





#' @rdname hidden_aliases
#' @export
setMethod(
  f          = "dbt_sql",
  signature  =
    signature(
      query_string = "SQL"
    ),

  definition =
    function(query_string, ...) {
      # paste together string, mark as SQL and return
      DBI::SQL(glue::glue(query_string, ...))
    }
)


#' @rdname hidden_aliases
#' @export
setMethod(
  f          = "dbt_sql",
  signature  =
    signature(
      query_string = "missing"
    ),

  definition =
    function(query_string, ...) {
      # paste together string, mark as SQL and return
      DBI::SQL(glue::glue(NULL, ...))
    }
)























