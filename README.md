# Exploring Average Arrival Time of Batch External Data Files

This README file is the supporting documentation accompagning the Shiny application availble [Here](https://marianofiorentino.shinyapps.io/shinyApp/)

In this repository it is possibile to see the source code of that application.

* LoaderStatBase.R
* server.R
* ui.R
* BaseLine.csv

For the associated Slidify presentation, click [Here](https://marianofiorentino.shinyapps.io/shinyApp/)

### Description of the Application

In a  system that load data from heterogeneous external sources to do complex computation, the arrival time of data files is critical to show updated data for the users of that system, is important to know when a data file is in late
To monitor that system has been built [on this platform](http://www.noframeworks.com/wp-content/uploads/2016/08/Architettura-1024x724.png) an application that:

- Collect the arrival time of every file
- Every week calculate the mean arrival time and the standard deviation per every file
- Every hour send a report to the Application Mantenance Team about what is over of 2 standard deviation over the mean

With the collected arrival time has been wrote a simple shiny application useful to explore the mean arrival time of every file.

This small application shows a plot with the indication of the mean and the critical arrival time per every file.
Instead of drawing an histogram with the arrival time groupped in bins, the plots are drawed using the calculated mean and standard deviation.

We have different files and different averages for weekdays and sunday, so in the application it is possibile to select with a combo if there are available data for sunday.
