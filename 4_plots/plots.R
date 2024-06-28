# PLOTLY ####
# install.packages("plotly")
library(plotly)

# Basic Box Plot ####
# Display the structure and sample data of the midwest dataset
head(midwest) 
str(midwest)

# Create a box plot for the percentage of college-educated individuals by state
fig <- plot_ly(midwest, x = ~percollege, color = ~state, type = "box") # ~ instead of midwest$
fig

# Scatter Plot with Hover Info ####
# 1. Basic scatter plot
fig <- plot_ly(type = 'scatter', mode = 'markers') # markers, lines, lines+markers
fig <- fig %>% 
  add_trace( # instead of getting data from a data frame
    name = 'Green Dots', # legend
    x = c(1:5), 
    y = rnorm(5, mean = 5),
    text = c("Text A", "Text B", "Text C", "Text D", "Text E"),
    hoverinfo = 'text',
    marker = list(color='green'),
    showlegend = TRUE
  )
fig

# 2. Multiple scatter plots
trace_0 <- rnorm(100, mean = 5)
trace_1 <- rnorm(100, mean = 0)
trace_2 <- rnorm(100, mean = -5)
x <- c(1:100)

scatter_data <- data.frame(x, trace_0, trace_1, trace_2)
str(scatter_data)
head(scatter_data)

fig <- plot_ly(scatter_data, x = ~x, y = ~trace_0, name = 'trace 0', type = 'scatter', mode = 'lines')
fig <- fig %>% add_trace(y = ~trace_1, name = 'trace 1', mode = 'lines+markers')
fig <- fig %>% add_trace(y = ~trace_2, name = 'trace 2', mode = 'markers')
fig <- fig %>% layout(hovermode = "x unified")
fig

# Pie Chart ####
fig <- plot_ly() 
fig <- fig %>%
  add_trace(
    type = "pie",
    name = "", # hiding trace name on hover
    values = c(2, 1, 3, 2.5),
    labels = c("R", "Python", "JavaScript", "Matlab"),
    text = c("textA", "TextB", "TextC", "TextD"),
    hovertemplate = "%{label}: <br>Popularity: %{percent} </br> %{text}" # html code
  )
fig

# Violin Plot ####
df <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/violin_data.csv") # customer data
str(df)
head(df)

# 1. Single violin plot
fig <- df %>% 
  plot_ly(
    type = 'violin',
    y = ~total_bill,
    box = list(visible = TRUE),
    meanline = list(visible = TRUE),
    x0 = 'Total Bill'
  )
fig <- fig %>%
  layout(
    yaxis = list(title = "", zeroline = FALSE) # Remove y label and zero line
  )
fig

# 2. Multiple violins per day
fig <- df %>%
  plot_ly(
    type = 'violin',
    y = ~total_bill,
    x = ~day,
    split = ~day,
    points = 'outliers', # all, outliers
    box = list(visible = TRUE),
    meanline = list(visible = TRUE),
    hoveron = "violins+points+kde" # violins+points+kde
  )
fig <- fig %>%
  layout(
    xaxis = list(title = "Day"),
    yaxis = list(title = "Total Bill", zeroline = FALSE)
  )
fig

# Heatmap ####
head(volcano)

# Basic heatmap
plot_ly(z = volcano, type = "heatmap")

# Heatmap with custom colors
RColorBrewer::display.brewer.all()
plot_ly(z = volcano, colors = "Set3", type = "heatmap")

# Heatmap with custom x and y labels
m <- matrix(rnorm(9), nrow = 3, ncol = 3)
plot_ly(
  x = c("a", "b", "c"), y = c("d", "e", "f"),
  z = m, type = "heatmap",
  colors = "YlOrRd",
  hovertemplate = "X: %{x} <br>Y: %{y} <br> Z: %{z:.2f} <extra></extra>" # <extra></extra> hides trace0 name
)

# Sankey Diagram ####
fig <- plot_ly(
  type = "sankey",
  orientation = "h", # v for vertical orientation
  node = list(
    label = c("A1", "A2", "B1", "B2", "C1", "C2"),
    color = c("blue", "orange", "#4aeaff", "blue", "blue", "blue"),
    pad = 100,
    thickness = 20,
    line = list( # border
      color = "black",
      width = 0.5
    )
  ),
  link = list(
    source = c(0,1,0,2,3,3),
    target = c(2,3,3,4,4,5),
    value =  c(8,4,2,8,4,2)
  )
)
fig <- fig %>% layout(
  title = "Basic Sankey Diagram",
  font = list(size = 10)
)
fig

# 3D Plots ####
# 3D Surface Plot with volcano data
fig <- plot_ly(z = ~volcano)
fig <- fig %>% add_surface()
fig

# 3D Scatter Plot with mtcars data
str(mtcars)
head(mtcars)

# Convert transmission type to factor labels
mtcars$am <- factor(mtcars$am, labels = c('Automatic', 'Manual'))

fig <- plot_ly(mtcars, x = ~wt, y = ~hp, z = ~qsec, color = ~am, colors = c('#BF382A', '#0C4B8E'))
fig <- fig %>% add_markers()
fig <- fig %>% layout(scene = list(xaxis = list(title = 'Weight'),
                                   yaxis = list(title = 'Gross horsepower'),
                                   zaxis = list(title = '1/4 mile time')))
fig

# 3D Line Plot
data <- read.csv('https://raw.githubusercontent.com/plotly/datasets/master/3d-line1.csv')
str(data)
head(data)

fig <- plot_ly(data, x = ~x, y = ~y, z = ~z, type = 'scatter3d', mode = 'lines', 
               opacity = 0.5, line = list(width = 6, color = ~color))
fig
