# server.R

library(maps)
library(mapproj)
states <- readRDS("Data/state.rds")
source("helpers2.R")



shinyServer(
  function(input, output) {
    output$text1 <- renderText({ 
      switch(input$var, 
             "Percent Graduate" = "Number of people graduating college",
             "Percent Born in US" = "Number of citizens by birth",
             "Percent Veterans" = "No. of veterans enlisted per state",
             "Percent unmarried males" = "Single Males[Random!]")
    })
    output$map <- renderPlot({
      data <- switch(input$var, 
                     "Percent Graduate" = states$pctGraduate,
                     "Percent Born in US" = states$bornInUS,
                     "Percent Veterans" = states$pct_veterans,
                     "Percent unmarried males" = states$pctMales_neverMarried)
      
      color <- switch(input$var, 
                      "Percent Graduate" = "darkgreen",
                      "Percent Born in US" = "lightblue",
                      "Percent Veterans" = "darkorange",
                      "Percent unmarried males" = "darkviolet")
      
      legend <- switch(input$var, 
                       "Percent Graduate" = "% Grad",
                       "Percent Born in US" = "% USBORN",
                       "Percent Veterans" = "% Vets",
                       "Percent unmarried males" = "% SingleM")
      
      percent_map(var = data, 
                  color = color, 
                  legend.title = legend, 
                  max = input$range[2], 
                  min = input$range[1])
    })
  }
)