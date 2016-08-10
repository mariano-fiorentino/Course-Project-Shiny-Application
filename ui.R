library(shiny)
source("LoaderStatBase.R")
dfSelected = LoaderStatBase("BaseLine.csv");
showList = comboList(dfSelected)

shinyUI(
    pageWithSidebar(  
        headerPanel("Explore the arrival time of input files on the system"),  
        sidebarPanel(
            titlePanel("Select the Input File"),
            selectInput("theLoader", "File Name", showList),
            selectInput("issun", "Distribution on Sunday", c(FALSE, TRUE)),
            p('Observed Mean:'),
            verbatimTextOutput("mean"),
            p('Critical Time:'),
            verbatimTextOutput("max")
        ), 
        mainPanel(    
            plotOutput('newHist')
    )
))