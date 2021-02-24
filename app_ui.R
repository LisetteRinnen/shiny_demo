# UI for scatterplot
library(shiny)
library(ggplot2)

# Get a vector of column names (from `mpg`) to use as select inputs
col_names <- colnames(mpg)

# Create a variable `x_input` that stores a `selectInput()` for your
# variable to appear on the x axis of your chart.
# Use the vector of column names as possible values, and make sure
# to assign an inputId, label, and selected value
x_input <- selectInput(
  inputId = "x_var", 
  choices = col_names, 
  label = "Choose an X Variable"
)

# Using a similar approach, create a variable `y_input` that stores a
# `selectInput()` for your variable to appear on the y axis of your chart.
# Add a `selectInput` for the `y` variable
y_input <- selectInput(
  inputId = "y_var", 
  choices = col_names, 
  label = "Choose an Y Variable"
)

# Create a variable `color_input` as a `selectInput()` that allows users to
# select a color from a list of choices
color_input <- selectInput(
  inputId = "color", 
  choices = c("red", "green", "purple"), 
  label = "Choose a color"
)

title_input <- textInput(
  inputId = "title", 
  label = "Set a chart title"
)

# Create a variable `size_input` as a `sliderInput()` that allows users to
# select a point size to use in your `geom_point()`
size_input <- sliderInput(
  inputId = "size", 
  label = "Set the point size", 
  min = 1, 
  max = 100, 
  value = 10
)

line_input <- selectInput(
  inputId = "line_var", 
  label = "Choose a variable for your line chart", 
  choices = c("avg_cty", "avg_hwy")
)

line_title_input <- textInput(
  inputId = "line_title", 
  label = "Set a line chart title"
)

# Create a variable `ui` that is a `fluidPage()` ui element. 
# It should contain:
ui <- fluidPage(
  title_input,
  plotlyOutput(outputId = "scatter"),
  line_input,
  line_title_input,
  plotOutput(outputId = "line"),
  color_input, 
  size_input, 
  x_input, 
  y_input
)
 