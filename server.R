#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    plot_data <- prisoner_data
    output$myPlot <- renderPlot({
    
    if(input$filter == "Keep NA's") {
        #filter only the x-variables
        plot_data <- filter(prisoner_data, who_vote_for!="NA", ever_voted!="NA", should_incarcerated_vote!="NA", lower_incarceration!="NA", end_private_prisons!="NA", stance_on_marijuana_legalization!="NA", stance_on_raise_min_wage!="NA", which_party_for_cj_reform!="NA", how_often_discuss_politics!="NA")
    } else if(input$filter == "Filter out NA's")
        #filter all variables
        plot_data <- filter(prisoner_data, who_vote_for!="NA", ever_voted!="NA", should_incarcerated_vote!="NA", lower_incarceration!="NA", end_private_prisons!="NA", stance_on_marijuana_legalization!="NA", stance_on_raise_min_wage!="NA", how_often_discuss_politics!="NA", which_party_for_cj_reform!="NA", age!="NA", highest_education_level!="NA", length_in_this_facility!="NA", race!="NA", gender!="NA", party!="NA")
    
       if(input$advanced == FALSE & input$plotType == "Stacked") {
            #commands to create stacked
     ggplot(plot_data) + geom_bar(aes(x=eval(as.name(input$xVar)), fill=eval(as.name(input$yVar)))) +
                labs(x=input$xVar, y= input$yVar) + coord_flip() + theme_minimal() + scale_fill_brewer(name="Key", palette = "Pastel1")
   
        } else if(input$advanced == FALSE & input$plotType == "Side-by-Side")
            #commands to create side
     ggplot(data=plot_data) + geom_bar(aes(x=eval(as.name(input$xVar)), fill=eval(as.name(input$yVar))), position="dodge") +
                labs(x=input$xVar, y= input$yVar) + coord_flip() + theme_minimal() + scale_fill_brewer(name="Key", palette = "Pastel1")
 ## FACETTING   
    else if(input$advanced == TRUE & input$plotType == "Stacked" & input$facet!="None")  {
    ggplot(plot_data) + geom_bar(aes(x=eval(as.name(input$xVar)), fill=eval(as.name(input$yVar)))) +
     labs(x=input$xVar, y= input$yVar) + coord_flip() + theme_minimal() + scale_fill_brewer(name="Key", palette = "Pastel1") + facet_wrap(as.name(input$facet))
  
      }  else  if (input$advanced == TRUE & input$plotType == "Side-by-Side" & input$facet!="None")
     ggplot(data=plot_data) + geom_bar(aes(x=eval(as.name(input$xVar)), fill=eval(as.name(input$yVar))), position="dodge") +
     labs(x=input$xVar, y= input$yVar) + coord_flip() + theme_minimal() + scale_fill_brewer(name="Key", palette = "Pastel1") + facet_wrap(as.name(input$facet))

    ## SUBSETTING
   else  if(input$advanced == TRUE & input$plotType == "Stacked" & input$subset!="None"& !is.null(input$subVal))  {
   plot_data <- subset(plot_data, eval(as.name(input$subset)) %in% input$subVal)
   ggplot(plot_data) + geom_bar(aes(x=eval(as.name(input$xVar)), fill=eval(as.name(input$yVar)))) +
     labs(x=input$xVar, y= input$yVar) + coord_flip() + theme_minimal() + scale_fill_brewer(name="Key", palette = "Pastel1")

   }  else  if (input$advanced == TRUE & input$plotType == "Side-by-Side" & input$subset!="None" & !is.null(input$subVal))  {
   plot_data <- subset(plot_data, eval(as.name(input$subset)) %in% input$subVal)
   ggplot(data=plot_data) + geom_bar(aes(x=eval(as.name(input$xVar)), fill=eval(as.name(input$yVar))), position="dodge") +
     labs(x=input$xVar, y= input$yVar) + coord_flip() + theme_minimal() + scale_fill_brewer(name="Key", palette = "Pastel1")
 }
    }) 
    
    output$value <- renderUI({
       if(input$advanced == TRUE){
           #  options for advanced options
           tagList(selectInput("facet", "Facet the Data", c("None", subVar)),
           selectInput("subset", "Subset the Data", c("None", subVar)))
    }

    })

    output$subsetValues <- renderUI({
      if(input$advanced == TRUE &!is.null(input$subset)){
        if(input$subset != "None"){
        checkboxGroupInput("subVal", "Choose values to include", levels(prisoner_data[,input$subset]))
                }}})
    
    }) 

# }) 


