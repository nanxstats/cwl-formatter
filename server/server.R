source("server/wrapper.R", local = TRUE)

react_format_cwl <- reactive({
  format_cwl(input$ace_input)
})

observeEvent(input$btn_format, {
  updateAceEditor(session, "ace_output", value = react_format_cwl())
})

output$btn_download <- downloadHandler(
  filename = function() {
    pb <- Sys.time()
    attributes(pb)$tzone <- "America/New_York" # convert to EST
    paste("cwlformat-", gsub(" ", "-", gsub(":", "-", pb)), ".cwl", sep = "")
  },
  content = function(file) {
    tmp <- tempfile(fileext = ".cwl")
    writeLines(react_format_cwl(), tmp)
    file.rename(tmp, file)
  }
)
