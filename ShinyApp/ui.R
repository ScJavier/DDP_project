library(shiny)

# Define UI for miles per gallon application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Exploratory for the Iris data set"),
  
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
      
      checkboxInput("regline", "Show regression line", FALSE)
      
    ),
    
    # Main panel to give some short instructions and to provide
    # results
    mainPanel(
      h3("Description:"),
      p("This ShinyApp has the pourpose to let you do a simple analysis
         of the Fisher's Iris data set."),
      # Pendiente por poner la descripción y la documentación
      p("The original data set has 150 observarions of 5 variables:
         - Sepal.Lentgh
         - Sepal.Width
         - Petal.Length
         - Petal.Width
         - Species"),
      h3("Results:"),
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