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
            selectInput("issun", "Sunday data", c(FALSE, TRUE)),
            p('Observed Mean:'),
            verbatimTextOutput("mean"),
            p('Critical Arrival Time:'),
            verbatimTextOutput("max")
        ), 
        mainPanel(
            plotOutput('newHist'),
            helpText(a("Source code and documentation",
                       href="https://github.com/mariano-fiorentino/Course-Project-Shiny-Application",
                       target="_blank")
            ),
            helpText(a("Slidify presentation",
                       href="https://mariano-fiorentino.github.io/Course-Project-Shiny-Application",
                       target="_blank")
            )
    )
))