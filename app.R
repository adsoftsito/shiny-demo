#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
#ui <- fluidPage(

    # Application title
#    titlePanel("adsoftsito - Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
#    sidebarLayout(
#        sidebarPanel(
#            sliderInput("bins",
#                        "Number of bins:",
#                        min = 1,
#                        max = 50,
#                        value = 30)
#        ),

        # Show a plot of the generated distribution
 #       mainPanel(
 #          plotOutput("distPlot")
 #       )
 #   )
#)

# Define server logic required to draw a histogram
#server <- function(input, output) {

#    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
#        x    <- faithful[, 2]
#        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
#        hist(x, breaks = bins, col = 'darkgray', border = 'white')
#    })
#}

require(readr)
countries <- read_csv("http://becomingvisual.com/rfundamentals/countries.csv")

# Define UI for application that draws a scatterplot
ui <- fluidPage(
    
    # Application title
    titlePanel("Country Data"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput("country",
                        "Countries",
                        paste(countries$Country), 
                        selected = "China", multiple = FALSE)
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("countryPlot")
        )
    )
)

# Define server logic required to draw a scatterplot
server <- function(input, output) {
    
    output$countryPlot <- renderPlot({
        country = input$country
        plot(countries$Population, countries$`GDP ($ per capita)`, col=ifelse(countries$Country==country, "red","black"),
             main = "Population and GDP", xlab = "Population", ylab = "GDP ($ per capita)",log="xy")
        options(scipen=999)
    })
}
# Run the application 
shinyApp(ui = ui, server = server)
