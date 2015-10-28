library(shiny)
library(leaflet)

shinyUI(fluidPage(

  # Application title
  titlePanel("Brussels - PMR portal"),
  leafletOutput("mapPMR"),
  p(),
  actionButton("recalc", "New points")
  

))
