read.Tilia3 <- function(fName, removeChron=FALSE) {
  if (!is.character(fName))
    stop("Expecting filename as first argument")
  ret <- .Call("ReadTiliaFile", fName, PACKAGE="riojaExtra")
  if (!is.null(ret[[1]])) {
    nms <- names(ret[[1]])
    names(ret[[1]]) <- iconv(nms, "ISO_8859-2", "UTF-8")
    df <- as.data.frame(ret[[1]], , check.names = FALSE, fix.empty.names=FALSE)
#    rownames(df) <- make.unique(ret[[2]])
    
    ret[[3]] <- make.unique(iconv(ret[[3]], "ISO_8859-2", "UTF-8"))
    vars=data.frame(CodeNames=ret[[3]], CodeNums=ret[[4]], FullNames=ret[[5]], Sums=ret[[6]])
    levels = data.frame(Names=make.unique(ret[[2]]), Depths = ret[[7]])
    mt <- na.omit(grep(toupper("Chron*"), toupper(colnames(df))))
    if (length(mt) > 0) {
      ch <- df[, mt]
      if (removeChron) {
        df <- df[, -mt]
      }
      levels <- cbind(levels, ch)
    }
    out <- list(data=df, vars=vars, levels=levels)
  }
  else {
    out <- NULL
    warning(ret[[8]])
  }
  return(out)
}
