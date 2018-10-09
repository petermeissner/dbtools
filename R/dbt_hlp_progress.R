#' dbt_hlp_progress
#'
#' @param i ith iteration / item / job / query
#' @param ii number of iterations / ... in total
#' @param start start time
#'
#' @export
#'
#' @examples
#'
#' dbt_hlp_progress(1)
#' dbt_hlp_progress(3, 10, Sys.time()-10)
dbt_hlp_progress <-
  function(i = NULL, ii = NULL, start = NULL, redraw = FALSE){
    if(redraw){
      cat("\r")
    }else{
      cat("\n")
    }
    cat( as.character(Sys.time()) )

    if( !is.null(i) ){
      cat(" |", i)
    }

    if( !is.null(ii) ){
      cat(" /", ii)
    }

    if( !is.null(start) ){
      cat(" | elapsed:",as.character(hms::as.hms(round(difftime(Sys.time(), start, units="sec")))))
    }

    if( !is.null(start) & !is.null(i) & !is.null(ii)){
      time_elapsed <- as.integer(round(difftime(Sys.time(), start, units="sec")))
      time_eta     <- time_elapsed/i * (ii - i)
      percent_done <- time_elapsed / (time_elapsed + time_eta)

      cat(" | eta:", as.character(hms::as.hms(time_elapsed)))
      cat(
        " |",
        rep("=", (  round(percent_done,1))*10) ,
        rep(".", (  round(1-percent_done,1))*10) ,
        "|",
        sep = ""
      )
    }

  }
