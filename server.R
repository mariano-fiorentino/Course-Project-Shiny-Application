library(shiny)
library(ggplot2)
library(grid)
source("LoaderStatBase.R")
dfSelected = LoaderStatBase("BaseLine.csv");

shinyServer(  
    function(input, output) {
 
        mean <- reactive({
            mean <- as.numeric(dfSelected[dfSelected$LOADER == input$theLoader & 
                                      dfSelected$ISSUN==input$issun,]$MEAN)
            validate(
                need(mean != "", "No data Found")
            )
            mean
        })
        
        max <- reactive({
            as.numeric(dfSelected[dfSelected$LOADER == input$theLoader & 
                                                dfSelected$ISSUN==input$issun,]$MAXDATE)
        })

        output$newHist <- renderPlot({

            sd = as.numeric(dfSelected[dfSelected$LOADER == input$theLoader & 
                                           dfSelected$ISSUN==input$issun,]$SD)      
            #degreeOfFreedom = as.numeric(dfSelected[dfSelected$LOADER == input$theLoader & 
            #                                            dfSelected$ISSUN==input$issun,]$COUNT)
            x <- seq(-4,4,length=100)*sd + mean()
            hx <- dnorm(x,mean(),sd)
            times = as.POSIXct(as.integer(x*60), origin="1970-01-01")
            dfPlot = data.frame(Time=times, Density=hx)
            
            ggplot(dfPlot, aes(Time, Density)) + geom_line( colour="blue") +
                geom_vline(xintercept = as.numeric(
                    c(as.POSIXct(mean()*60, origin="1970-01-01"),
                      as.POSIXct(max()*60, origin="1970-01-01"))), colour=c("green","red")) +
#                ggtitle(dfSelected$LOADER) +
                annotate("text", x = as.POSIXct(max()*60+20, origin="1970-01-01"), y = min(hx), label = "Critical") +
                annotate("text", x = as.POSIXct(mean()*60-20, origin="1970-01-01"), y = min(hx), label = "Mean")
            
        })
        output$mean =  renderPrint(format(as.POSIXct(mean()*60, origin="1970-01-01"), format="%H:%M:%S"))
        output$max =  renderPrint(format(as.POSIXct(max()*60, origin="1970-01-01"), format="%H:%M:%S")) 
    }
)