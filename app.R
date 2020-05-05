library("shiny")
library("shinydashboard")
library("shinyAce")

ui <- uiOutput("ui")

server <- function(input, output, session) {
  output$ui <- renderUI({
    source(file.path("ui", "header.R"), local = TRUE)$value
  })

  source(file.path("server", "server.R"), local = TRUE)$value
}

shinyApp(ui, server)
