shinyUI(fluidPage(
  titlePanel("Interesting demographic visualizations"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create demographic maps with 
        information from the 2013 US Data."),
      
      selectInput("var", 
                  label = "Choose a variable to display",
                  choices = c("Percent Graduate", "Percent Born in US",
                              "Percent Veterans", "Percent unmarried males"),
                  selected = "Percent White"),
      
      sliderInput("range", 
                  label = "Range of interest:",
                  min = 0, max = 100, value = c(0, 100))
    ),
    
    mainPanel(textOutput("text1"),plotOutput("map"))
  )
))