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
par(mfrow = c(2, 2), mar=c(4, 4, 2 ,1), oma = c(0, 0, 2, 0))
with(x, {
  plot(datetime, Global_active_power, type="l", 
       xlab="", ylab="Global Active Power (kilowatts)")
  plot(datetime, Voltage, type="l",
       xlab="datetime", ylab="Voltage")
  plot(datetime, Sub_metering_1, type="l", 
       xlab="", ylab="Global Active Power (kilowatts)")
  lines(datetime, Sub_metering_2, col="red")
  lines(datetime, Sub_metering_3, col="blue")
  legend("topright", bty="n", lty=1, col= c("black", "blue", "red"), cex=0.5,
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(datetime, Global_reactive_power, type="l")
})