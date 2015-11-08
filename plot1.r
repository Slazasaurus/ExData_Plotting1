#load data (use colClasses?) It's the time field that doesn't make sense
#As written, must be run in same directory as data table.
x <- read.table("household_power_consumption.txt", sep=";", 
                na.strings= "?", header=TRUE, nrows=2075259,
                colClasses = c("character", "character", "numeric", "numeric", "numeric", 
                               "numeric", "numeric", "numeric", "numeric"))
x$Time = strptime(x$Time, "%H:%M:%S")
x$Date = as.Date(x$Date, "%d/%m/%Y")
# Hardcoded because lazy, had difficulties with 
# more flexible subsetting for some reason.
x <- x[66637:69516,]
hist(x$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")