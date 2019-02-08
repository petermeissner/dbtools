#' dbt_sql_gen_column_as
#'
#' Function that ehlps generating sql snippets where column names are renamed in a (e.g. select) statement on the fly via `as`.
#'
#' @param con a connection object
#' @param table_name a table
#' @param prefix prefix for new column names 
#'
#' @return
#' @export
#'
#' @examples
dbt_sql_gen_column_as <-
  function(con, table_name, prefix = table_name){
    # gather info
    table_prototype <- dbGetQuery(con, glue::glue("select * from {table_name} limit 1"))
    column_names    <- names(table_prototype)
    
    # glue info into sql snippet
    txt <- glue::glue("{table_name}.{column_names} as {prefix}_{column_names}")
    
    # collapse strings and return
    glue::glue_collapse(txt, sep = ",\n")
  }
