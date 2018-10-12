#' @rdname hidden_aliases
#' @export
setMethod(
  f          = "+",
  signature  = signature(e1 = "SQL", e2 = "ANY"),
  definition =
    function(e1, e2){
      SQL(paste0(e1,e2))
    }
)
