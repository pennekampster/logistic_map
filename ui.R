
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
  sidebarLayout(
    
    sidebarPanel(
      sliderInput("start_x",
                  "Initial value:",
                  min = 0,
                  max = 1,
                  step = 0.01,
                  value = 0.4)
    ,
    
      sliderInput("growth_rate",
                  "Growth rate:",
                  min = 0,
                  max = 4.0,
                  step = 0.01,
                  value = 0)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("tsplot")
    )
  )
))
