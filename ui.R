library(shiny)
library(leaflet)

shinyUI(fluidPage(
  includeCSS('www/style.css'),
  div(h1("GoEasy! Brussels"),align="center"),
  div(h3("Services Bruxellois avec accès facilité"),align="center"),
  p(),
  hr(),
  fluidRow(
    column(3,
           uiOutput("showDatasetsDropdown")
    ),
    column(9,
           leafletOutput("mapPMR")
    )
  )
))
