x <- read.table("household_power_consumption.txt", sep=";", 
                na.strings= "?", header=TRUE, nrows=2075259,
                colClasses = c("character", "character", "numeric", "numeric", "numeric", 
                               "numeric", "numeric", "numeric", "numeric"))

# Hardcoded because lazy, had difficulties with 
# more flexible subsetting for some reason.
x <- x[66637:69517,]
datetime <- cbind(x$Date, x$Time)
datetime <- paste(datetime[,1], datetime[,2], sep=" ")
datetime <- strptime(datetime, format="%d/%m/%Y %H:%M:%S")
cbind(datetime, x)
with(x, plot(dt, Global_active_power, type="l", 
             xlab="", ylab="Global Active Power (kilowatts)"))