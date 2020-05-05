cwl_example <- paste(readLines("data/original-no-comment.cwl"), collapse = "\n")

tabPanel(
  tags$head(tags$link(rel = "shortcut icon", href = "favicon.png")),
  title = "CWL Formatter",

  # use shinydashboard components
  includeCSS(path = "www/AdminLTE.css"),
  includeCSS(path = "www/shinydashboard.css"),

  # customize bootstrap and ace editor
  includeCSS(path = "www/ace.css"),
  includeCSS(path = "www/custom.css"),

  shinydashboard::box(
    width = 6,
    title = "Paste unformatted CWL here", status = "primary", solidHeader = TRUE,

    fluidRow(
      column(
        width = 12,
        aceEditor(
          "ace_input",
          height = "500px",
          mode = "yaml", theme = "textmate", fontSize = 14, readOnly = FALSE,
          value = cwl_example
        ),
        actionButton("btn_format", "Format", class = "btn btn-sm btn-block", icon = icon("align-left"))
      )
    )
  ),

  shinydashboard::box(
    width = 6,
    title = "Formatted CWL", status = "primary", solidHeader = TRUE,

    fluidRow(
      column(
        width = 12,
        aceEditor(
          "ace_output",
          height = "500px",
          mode = "yaml", theme = "textmate", fontSize = 14, readOnly = FALSE
        )
      ),
      column(
        width = 12,
        downloadButton(
          "btn_download",
          label = "Download",
          class = "btn btn-sm btn-block"
        )
      )
    )
  ),

  fluidRow(
    column(
      width = 12
    )
  ),

  fluidRow(
    HTML('<p align="center">&copy; 2020 <a href="https://www.cancergenomicscloud.org/" target="_blank">Cancer Genomics Cloud</a> by <a href="https://www.sevenbridges.com/" target="_blank">Seven Bridges</a></p>'),
    HTML('<p align="center">Licensed under the GNU Affero GPL v3</p>')
  ),

  tags$script(HTML("var header = $('.navbar > .container-fluid'); header.append('<div style=\"float:right;margin:15px;\"><a href=\"https://github.com/nanxstats/cwl-formatter\" target=\"_blank\" style=\"color:white\">Source Code</a>&nbsp;&nbsp;<font color=\"white\">|</font>&nbsp;&nbsp;<a href=\"https://github.com/rabix/cwl-format\" target=\"_blank\" style=\"color:white\">Python Package</a>&nbsp;&nbsp;<font color=\"white\">|</font>&nbsp;&nbsp;<a href=\"https://github.com/rabix/cwl-format/tree/master/tests/cwl\" target=\"_blank\" style=\"color:white\">Unformatted CWL Examples</a>&nbsp; </div>'); console.log(header)"))
)
