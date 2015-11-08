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
with(x, plot(datetime, Sub_metering_1, type="l", 
                           xlab="", ylab="Global Active Power (kilowatts)"))
with(x, lines(datetime, Sub_metering_2, col="red"))
with(x, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", pch = 1, col= c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))