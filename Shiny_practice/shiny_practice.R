#Shiny practice

#clear environment
rm(list=ls())

library(shiny)

# Define UI ----
ui <- fluidPage(
  titlePanel("Copy of Shiny App"),
  sidebarLayout(position="left",
    sidebarPanel(
      h2("Installation"),
      p("Shiny is available on CRAN, so you can install it the usual way from your R console"),
      br(),
      code("install.packages(shiny)"),
      img(src = "rstudio.png", heigh=100, width=200),
      p("Shiny is a product of",
        span("RStudio", style="color:blue"))
    ),
    mainPanel(
      h1("Introducing Shiny", position="center"),
      p("Shiny is a new package from RStudio that makes it",
        em("incredibly easy"), 
        "to build interactive web applications with R."),
      br(),
      p("For an introduction and live examples, visit the",
        a("Shiny homepage.",
        href = "http://shiny.rstudio.com")),
      h2("Features"),
      p("- Build useful web applications with only a few lines of code - no JavaScript required."),
      p("- Shiny applications are automatically 'live' in that same way that",
        strong("spreadsheets"),
        "are live. Outputs change instantly as users modify inputs, without requiring reloading of the browser")
    )
  )
)
# Define server logic ----
server <- function(input, output) {
  
}

# Run the app ----
shinyApp(ui = ui, server = server)