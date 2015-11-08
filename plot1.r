#load data (use colClasses?) It's the time field that doesn't make sense
x <- read.table("household_power_consumption.txt", sep=";", 
                na.strings= "?", header=TRUE, nrows=2075259,
                colClasses = c("character", "character", "numeric", "numeric", "numeric", 
                               "numeric", "numeric", "numeric", "numeric"))
x$Time = strptime(x$Time, "%H:%M:%S") #this adds the date data for some reason
x$Date = as.Date(x$Date, "$d/%m/%Y")