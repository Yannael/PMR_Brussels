library(shiny)
library(leaflet)

shinyServer(function(input, output) {

  output$showDatasetsDropdown<-renderUI({
    isolate({
      niceNames<-as.vector(datasetsNames)
    #  selectInput('datasetsDropdown', 'Select data to display', niceNames, 
    #              selected=niceNames[1],multiple=TRUE, selectize=TRUE)
      selectInput('datasetsDropdown', 'Select data to display', 
                  choices = list(
                    Transports = c('Arret Stib' = 'STIB', 'Parking' = 'PARKINGBLUE'),
                    Services = c('Centre ONE' = 'Centre ONE'),
                    Other = c('OpenStreet Map' = 'Hotel')) ,
                  selected="",multiple=TRUE, selectize=TRUE)
    })
  })
  
  output$mapPMR <- renderLeaflet({
    selected<-input$datasetsDropdown
    if (length(selected)>0) {
    to.keep<-which(data[,1] %in% selected)
    points <- data.matrix(data[to.keep,c(6,5)])
    
    leaflet() %>%
      addProviderTiles("Stamen.TonerLite",
                       options = providerTileOptions(noWrap = TRUE)) %>%
      #addProviderTiles() %>%
      #addWMSTiles("http://geoserver.gis.irisnet.be/urbis/wms/gwc?SERVICE=WMS&REQUEST=GetMap&VERSION=1.1.1&LAYERS=urbisFR&STYLES=&FORMAT=image/png&TRANSPARENT=true&HEIGHT=600&WIDTH=600&SRS=EPSG:31370&BBOX=140000.0,160000.0,160000.0,180000.0
#") %>%
      addMarkers(data = points,popup=data[to.keep,2])
    }
    })
  
})
