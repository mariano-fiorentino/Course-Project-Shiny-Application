
LoaderStatBase <- function (file)
{
    library(lubridate)
    library(dplyr)
    library(tidyr)
    df <- read.csv(file, sep = "\t", header = TRUE, stringsAsFactors = FALSE);    
    return (df);
}

comboList <- function(dataFrame){
    
    listOfLoader = unique(dataFrame$LOADER)
    return (listOfLoader)
}







