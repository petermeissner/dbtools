#' dbt_hlp_progress
#'
#' @param i ith iteration / item / job / query
#' @param ii number of iterations / ... in total
#' @param start start time
#'
#' @return
#' @export
#'
#' @examples
#'
#' dbt_hlp_progress(1)
#' dbt_hlp_progress(3, 10, Sys.time()-10)
dbt_hlp_progress <-
  function(i = NULL, ii = NULL, start = NULL, redraw = FALSE, now = Sys.time()){
    if(redraw){
      cat("\r")
    }else{
      cat("\n")
    }
    cat( as.character(now) )

    if( !is.null(i) ){
      cat(" |", i)
    }

    if( !is.null(ii) ){
      cat(" /", ii)
    }

    if( !is.null(start) ){
      cat(" | elapsed:",as.character(hms::as.hms(round(difftime(now, start, units="sec")))))
    }

    if( !is.null(start) & !is.null(i) & !is.null(ii)){
      time_elapsed <- max(0.0001, as.integer(difftime(now, start, units="sec")))
      time_eta     <- (time_elapsed / i) * (ii - i)
      percent_done <- time_elapsed / (time_elapsed + time_eta)
      time_elapsed <- round(time_elapsed)

      cat(" | eta:", as.character(hms::as.hms(round(time_eta))))

      cat(
        " |",
        rep("=",   round(percent_done*10)) ,
        rep(".",   round((1-percent_done)*10)) ,
        "|",
        sep = ""
      )
    }

  }
