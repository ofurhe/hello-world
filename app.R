library(shiny)
library(ITHIM)
library(ggplot2)
library(reshape2)

#hard coded data
countyNames <- c("ELD","ELD","ELD","ELD","PLA","PLA","PLA","PLA","SAC","SAC","SAC","SAC","SUT","SUT","SUT","SUT","YOL","YOL","YOL","YOL","YUB","YUB","YUB","YUB")
DemogrGroup <- c("1.NHW","2.NHB","3.NHO","4.HO", "1.NHW","2.NHB","3.NHO","4.HO","1.NHW","2.NHB","3.NHO","4.HO","1.NHW","2.NHB","3.NHO","4.HO","1.NHW","2.NHB","3.NHO","4.HO", "1.NHW","2.NHB","3.NHO","4.HO")
V1 <- c(.2,9.1,-.7,.72,.2,9.1,-.7,.72,.2,9.1,-.7,.72,.2,9.1,-.7,.72,.2,9.1,-.7,.72,.2,9.1,-.7,.72)
df.death.race.2020Demo <- data.frame(countyNames, DemogrGroup, V1)

ui <- fluidPage(
  sliderInput(inputId = "mwt",
              label = "Mean Walking Time (min per week)",
              value = 47.49, min = 20, max = 100),
  plotOutput("Deaths")
  
)
server <- function(input, output) {
  output$Deaths <- renderPlot({  
    ggplot(data = df.death.race.2020Demo, mapping = aes(x = countyNames, y = V1,fill = DemogrGroup)) +
      geom_bar(stat = 'identity',width = 0.5, position = position_dodge(0.5))+xlab('County')+ylab('Death Reduction Rate (per 100,000 population)')+
      ggtitle("Age-std reduction in total deaths by race/ethnicity (scenario 2020)")
  })
}

shinyApp(ui = ui, server = server)
                                     
