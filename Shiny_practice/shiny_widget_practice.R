#Shiny App practice continued with widgets

#clear environment
rm(list=ls())

# Define UI ----
library(shiny)

# Define UI ----
ui <- fluidPage(
  titlePanel(h1("Census Vis")),
  sidebarLayout(
    sidebarPanel(
      p("Create demographic maps with information from with 2010 U.S. Census.", style=("color:gray")),
      selectInput("var", h4("Choose variable to display"),
                  choices = list("Percent White", "Percent Black",
                                 "Percent Asian", "Percent Hispanic"), selected = "Percent White"),
       sliderInput("ROI", h3("Region of Interest:"),
                       min = 0, max = 100, value = c("0", "100"))
    ),
    mainPanel(
      textOutput("selected_var")
    )
  )
)
# Define server logic ----
server <- function(input, output) {
}
# Run the app ----
shinyApp(ui = ui, server = server)