navbarPage(
  windowTitle = "CWL Formatter - Seven Bridges",
  title = div(img(src = "cgc-logo.svg", style = "width:70%;margin:-5px -26px 20px 8px;"), br(), HTML("&emsp;")),
  source(file.path("ui", "tab.R"), local = TRUE)$value
)
