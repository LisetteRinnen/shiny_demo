### Exercise 5 ###

library(shiny)
library(ggplot2)
# Create a shiny server that creates a scatterplot. 
# If we want to calculate the average `hwy` and `cty` miles per gallon
# each year in the mpg dataset, how do we do it:
avg_by_year <- mpg %>% 
  group_by(year) %>% 
  summarize(avg_cty = mean(cty, na.rm = T), 
            avg_hwy = mean(hwy, na.rm = T))

# It should use an `input` with features: `x_var`, `y_var`, `color`, and `size`
# Save the result of `renderPlot` to output$scatter
server <- function(input, output) {
 
  output$scatter <- renderPlotly({
    my_plot <- ggplot(data = mpg) +
      geom_point(mapping = aes_string(x = input$x_var, y = input$y_var), 
                 color = input$color, size = input$size) +
      labs(title = input$title)
    ggplotly(my_plot) # make it interactive!
  })
  
  output$line <- renderPlot({
    ggplot(avg_by_year) +
      geom_line(mapping = aes_string(x = "year", y = input$line_var)) +
      ylim(0, 25) +
      labs(title = input$line_title)
  })
}