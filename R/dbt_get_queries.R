#' wpd_get_query
#'
#' Establish a connection, execute SQL statement against database, close connection and return.
#'
#' @param query SQL statement to execute
#' @param verbose return extra information -- timings, potential database errors -- or not
#'
#' @export
#'
#' @examples
#'
#'
dbt_get_queries <-
  function(queries, verbose = TRUE, con = NULL){

    # establish connection
    if( is.null(con) ){
      con <- wpd_connect()
      close_connection <- TRUE
    } else {
      close_connection <- FALSE
    }


    # prepare storage for querry results
    res <- list()

    # start transaction
    DBI::dbBegin(conn = con)

    on.exit(
      expr = {

        # check for errors
        check <-
          vapply(
            X         = res,
            FUN       = function(x){x$status$errorMsg != "OK"},
            FUN.VALUE = logical(1)
          )

        # rollback on any error or commit if no error was found
        if ( any(check) ){
          DBI::dbRollback(con)
          if ( verbose == TRUE ) {
            "transaction rolled back"
          }
          transaction_status <- "rollback"
        }else{
          DBI::dbCommit(con)
          if ( verbose == TRUE ) {
            "transaction commited"
          }
          transaction_status <- "commit"
        }

        # close connection
        if ( close_connection ){
          DBI::dbDisconnect(con)
        }
      }
    )



    # execute query and get potential exception/error
    res <- lapply(queries, wpd_get_query, verbose = TRUE, con = con)

    if ( verbose == FALSE){
      res_return <- lapply(res, `[[`, "return")
    }else{
      res_return <- res
    }

    # return
    res_return
  }

