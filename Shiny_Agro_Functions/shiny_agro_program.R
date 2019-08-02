#Shiny Code for Agro Bacterium

#clear environemnt
rm(list=ls())

# Define UI ----

library(shiny)
library(shinythemes)
source("agro_functions_shinied.R")

ui <- fluidPage(
  navbarPage(theme = shinytheme("superhero"),
             "Choose Function",
             tabPanel("Growth Volume Calculator",
               titlePanel(h1("Growth Volume Calculator")),
               
               sidebarLayout(
                 position = "left",
                 sidebarPanel(
                   h2("Inputs:"),
                   
                   selectInput("bacteria",
                     h4("Choose type of bacteria"),
                     choices = list("AGL1", "E.coli")),
                   
                   numericInput("OD600",
                                p("OD600 of Starter Culture:"),
                                value = 1),
                   
                   numericInput("Hours",
                                p("Hours of Incubation:"),
                                value = 24),
                   
                   numericInput("DESOD600",
                                p("Desired OD600:"),
                                value = .6)
                 ),
                 mainPanel(
                   h1("Instructions:"),
                   h2("1. Select bacteria."),
                   h2("2. Input OD600 of your liquid starter culture. Note that it must be below an OD600 value of 1, dilute starter culture if it exceeds this value."),
                   h2("3. Input the desired incubation time in hours."),
                   h2("4. Input the desired OD600 at the end of desired incubation time."),
                   h2("5. Interpretation of results: The first value tells the volume with which to innoculate a",
                     strong("fresh/sterile 50ml liquid aliquot"),
                     "with, the second tells you what percentage of the bacteria will be fresh ie. new daughter cells."),
                   br(),
                   h2(textOutput("amount"))
                 )
               )
             ),
             tabPanel("Growth Hours Caclulator",
               titlePanel(h1("Growth Hours Calculator")),
               sidebarLayout(
                 position = "left",
                 sidebarPanel(
                   h2("Inputs:"),
                   
                   selectInput("bacteria",
                     h4("Choose type of bacteria"),
                     choices = list("AGL1", "E.coli")),
                   
                   numericInput("OD600hours",
                                p("OD600 of your culture"),
                                value =.2),
                   
                   numericInput("FinalOD",
                                p("Desired final OD600"),
                                value =.5),
                   
                   numericInput("Starterinnoculate",
                     p("Volume of starter culture used to innoculate in mL"),
                     value = 1.5)),
                 
                 mainPanel(h1("Instructions:"),
                           h2("1. Select bacteria."),
                           h2("2. Input the OD600 of your starter culture."),
                           h2("3. Input the desired final OD600 of the", strong("50 mL fresh/sterile media", "you will innoculate.")),
                           h2("4. Input the volume of the starter culture you added to the", strong("50 mL fresh/sterile media.")),
                           h2("5. Interpretation of Results: The first value tells how long it will take for the culture to grow to the desired OD600 at its optimal incubation temperature. The second value tells you what percentage of the culture will be fresh ie. new daughter cells."),
                           h2(textOutput("hours"))
                           )
               )
             )
  )
)
# Define server logic ----
server <- function(input, output) {
  output$amount <-
    renderPrint(
      bacteria_find_volume(
        Final_OD = input$DESOD600,
        starter_culture_OD = input$OD600,
        Hours = input$Hours,
        this_bacteria = input$bacteria
      )
    )
  output$hours <-
    renderPrint(
      bacteria_find_hours(
        Final_OD = input$FinalOD,
        starter_culture_OD = input$OD600hours,
        Volume_starter_inoculate = input$Starterinnoculate,
        this_bacteria = input$bacteria
      )
    )
  
}

# Run the app ----
shinyApp(ui = ui, server = server)