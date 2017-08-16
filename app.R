library(shiny)
ui <- fluidPage(
  sliderInput(inputId = "num",
              label = "Mean Walking Time (min per week)",
              value = 47.49, min = 20, max = 100),
  plotOutput("Deaths")
)

server <- function(input, output) {
  
  data <- reactive({
    rnorm(input$num)
  })
  output$Deaths <- renderPlot({ 
    title <- "Deaths"
    hist(data(), main = title)
  })
}

shinyApp(ui = ui, server = server)