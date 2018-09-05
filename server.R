library(shiny)
library(leaflet)

server <- function(input, output) {
        
        coords <- reactiveValues(x = -76.6122, y = 39.2904)
        getCoords <- reactive({
                if (input$city=="Baltimore") {
                        coords$x <- -76.6122 
                        coords$y <- 39.2904
                }
                if (input$city=="London") {
                        coords$x <- -0.1278
                        coords$y <- 51.5074
                }
                if (input$city=="Kathmandu") {
                        coords$x <- 85.3240
                        coords$y <- 27.7172
                }
                if (input$city=="Sydney") {
                        coords$x <- 151.2093 
                        coords$y <- -33.8688
                }
        })
        
        points <- eventReactive(input$recalc, {
                getCoords()
                cbind(rnorm(10)/4+coords$x, rnorm(10)/8+coords$y)
        }, ignoreNULL = FALSE)
        
        output$mymap <- renderLeaflet({
                leaflet() %>%
                        addProviderTiles(providers$Stamen.TonerLite,
                                         options = providerTileOptions(noWrap = TRUE)
                        ) %>%
                        addMarkers(data = points())
        })
}