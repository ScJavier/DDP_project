library(shiny)
library(datasets)
library(ggplot2)

irisData <- iris[iris$Species != "setosa",]

# Define server logic required to plot and print a summary for
# the fitted linear model
shinyServer(function(input, output) {
  
  # Compute text for the plot title
  headplotText <- reactive({
    paste("Scatter plot of", input$var_x, "vs.", input$var_y)
  })
  
  # Compute formula for the linear model fit
  formulaText <- reactive({
    paste(input$var_y,"~",input$var_x)
  })
  
  # Fit the linear model and keep the summary
  summFit <- reactive({
    summary(lm(as.formula(formulaText()), data = irisData))
  })
  
  # Extract useful statistics from summFit
  summStats <- reactive({
    data.frame("Estandar error" = summFit()$sigma,
               "R squared" =  summFit()$r.squared,
               "Adj R squared" = summFit()$adj.r.squared)
  })

  # Return text for printing as plot title
    output$caption <- renderText({
    headplotText()
  })
  
  # Generate a plot of the requested variable and
  # for the type selected
    output$scPlot <- renderPlot({
      
      new.data = data.frame(var1 = irisData[,input$var_x], 
                            var2 = irisData[,input$var_y])
      
      p <- ggplot(data = new.data, aes(x = var1, y = var2)) + 
           geom_point(size = 4, colour = "steelblue") +
           xlab(input$var_x) + ylab(input$var_y)
      
      # This code adds the linear regression line
      if (input$regline){
        p <- p + geom_smooth(method = "lm", size = 1,
                             colour = "coral", se = FALSE,
                             linetype = 2)
      }
      p
    })
    
    # Return the anova table of the linear model 
    output$coeff <- renderTable({
      summFit()$coefficients
    })

    # Return the table of basic statistics
    output$stats <- renderTable({
      summStats()
    })
})
