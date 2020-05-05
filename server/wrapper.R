library("reticulate")

#' @examples
#' format_cwl(paste(readLines("data/original-no-comment.cwl"), collapse = "\n"))
format_cwl <- function(x) {
  cwlformat <- reticulate::import("cwlformat")
  cwlformat$formatter$cwl_format(x)
}
