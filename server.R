library(shiny)
library(leaflet)

shinyServer(function(input, output) {

  getPoints <- eventReactive(input$recalc, {
    cbind(rnorm(40) * 2 + 13, rnorm(40) + 48)
  }, ignoreNULL = FALSE)
  
  output$mapPMR <- renderLeaflet({
    points <- data.matrix(data[,c(5,4)])
    
    #points<-getPoints()
    #browser()
    leaflet() %>%
      addProviderTiles("Stamen.TonerLite",
                       options = providerTileOptions(noWrap = TRUE)
      ) %>%
      addMarkers(data = points)
  })
  
})
