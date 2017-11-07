library(shiny)
library(ggplot2)


# GUI

ui <- fluidPage(
  titlePanel("Diamonds Data"),
  sidebarLayout(
    sidebarPanel(
    helpText("This app is to visualize diamonds dataset"),   #helptext insde the side panel 
    textInput(inputId = "title",
              label = "Chart title",
              value = ""),
    selectInput(inputId = "pos",
                label = "Position",
                choices = list("stack", "dodge"),
                selected = "stack")
  ),
  mainPanel(
    plotOutput(outputId = "plot")
  )
)
)


# Server

server <- function(input,output) {
  
  output$plot = renderPlot({
    ggplot(diamonds, aes(x=cut, fill = clarity)) + 
      geom_bar()+   # the plot is still not showing 
      ggtitle(input$title)  #use the money sign to spefify title 
  })
  
}

#run the app 
shinyApp(ui,server)

