#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    titlePanel("Prisoner Politics"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("xVar","Select an independent variable", xVar), 
            selectInput("yVar", "Select a dependent variable", yVar), 
            selectInput("plotType", "Select a type of plot", c("Stacked", "Side-by-Side")),
            selectInput("filter", "Filter or keep NA's", c("Filter out NA's", "Keep NA's")), 
            checkboxInput("advanced","Enable advanced options", FALSE),
            uiOutput("value"), 
            uiOutput("subsetVariables"),
            uiOutput("subsetValues"),
        ), 
            
        # Show a plot of the generated distribution
        mainPanel(
        plotOutput("myPlot"), 
           p("This data comes from The Marshall Project and Slate conducting the first-of-its-kind political survey
            inside prisons and jails across the country. Now that criminal justice is a campaign issue and many states
            are restoring voting rights to those convicted of felonies, they asked thousands of incarcerated people across 
            the country for their opinions on criminal justice reform, which political party they identify with and which 
            presidential candidate they’d support."),
            
            p("This data visualization attempts to see what these prisoners think about major issues, especially issues that pertain to 
            prison rights."),
        
            p("Here is the link to the data: https://github.com/themarshallproject/incarcerated_survey"),
             
            p("By: Lucy Morrison and Arjun Ravi"),
        
            p("Notes: This survey data contains a lot of missing information. If you would like to see the NA values, we have enabled that option, and the values are shown by the blank bar only available in the Stacked option. Also, this app allows you to facet or subset, not both simultaneously. Please set one to 'None' if you are going to use the other. ")
        
                
        )
    )
))
