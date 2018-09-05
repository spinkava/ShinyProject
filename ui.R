library(shiny)
library(leaflet)

ui <- fluidPage(
        titlePanel("Random Point Generator"),
        h3("To operate this app, select the city from the dropdown menu. 
                   Then click the New Points button. You will then get a map of random 
                   points around that city."),
        sidebarLayout(
                sidebarPanel(
                        actionButton("recalc", "New Points"),
                        selectInput("city","City",
                                    c("Baltimore","London","Kathmandu","Sydney"),
                                    selected = "Baltimore")
        
                ),
                mainPanel(
                        leafletOutput("mymap"),
                        p()
                )
        )
)