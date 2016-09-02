
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Logistic map"),

  # Sidebar with a slider input for number of bins
  #sidebarLayout(
    
    fluidRow(
      column(width = 4, offset=4,
      
      numericInput("start_x1",
                   "Initial value 1:", 
                   0.6, 
                   min = NA, 
                   max = NA, 
                   step = NA,
                   width = NULL)  
    ,
    numericInput("start_x2",
                 "Initial value 2:", 
                 0.6, 
                 min = NA, 
                 max = NA, 
                 step = NA,
                 width = NULL) 
    ,
    
      sliderInput("growth_rate",
                  "Growth rate:",
                  min = 0,
                  max = 4.0,
                  step = 0.01,
                  value = 0)
    ),

    # Show a plot of the generated distribution
    fluidRow(
      column(width = 12, 
      plotOutput("tsplot")
    )
  )
)
)
)