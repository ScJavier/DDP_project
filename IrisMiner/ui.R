library(shiny)

# Define UI for miles per gallon application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Developing Data Products project: Iris miner"),
  
  # Sidebar with controls to select variables to plot and to select
  # if the plot will show a regression line
  sidebarLayout(
    sidebarPanel(
      selectInput("var_x", "Sepal feature (x axis):",
                  c("Length" = "Sepal.Length",
                    "Width" = "Sepal.Width")),
      
      selectInput("var_y", "Petal feature (Y axis):",
                  c("Length" = "Petal.Length",
                    "Width" = "Petal.Width")),
      
      checkboxInput("regline", "Show regression line", FALSE),
      h4("Description:"),
      p("This ShinyApp lets you explore the Fisher's Iris data set.
        There are four variables, choose a pair of them and look if
        there is a linear association between them."),
      h4("What is this app for?"),
      p("With Iris miner you can do:"),
      tags$ul(
        tags$li("Show a scatterplot with an optional regression line."),
        tags$li("Display a simple anova table for the associated regression model."),
        tags$li("Show some basic statistics to undestand the linear association between your variables")
      ),
      h4("Instructions:"),
      tags$ul(
        tags$li("Select variables for x and y axes"),
        tags$li("Optional: Check the box if you want to include a regression line in your graphic."),
        tags$li("See your plot and summary tables, then make your conclussions.")
      )
    ),
    
    # Main panel to give some short instructions and to provide
    # results
    mainPanel(h3("Results:"),
      h4(textOutput("caption")),
      plotOutput("scPlot"),
      h4("Summary from a linear model fit"),
      h5("Analysis of variance"),
      tableOutput("coeff"),
      h5("Summary statistics"),
      tableOutput("stats")
    )
  )
))