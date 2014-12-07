setwd("~/Desktop/coursera/Exploratory Data Analysis/Week 1/assignment")
inputData <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, header=TRUE, na.strings="?")
data <- inputData
data$TimeStamp <- strptime(paste(data$Date, data$Time), format= "%d/%m/%Y %H:%M:%S")
febData <- subset(data, TimeStamp>=as.POSIXct("2007-02-01 00:00:00") & 
                    TimeStamp < as.POSIXct("2007-02-03 00:00:00"))


png(file="plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# Plot 2
plot(febData$TimeStamp, febData$Global_active_power, ylab="Global Active Power",  xlab="", type="l")


# voltage chart
plot(febData$TimeStamp, febData$Voltage, ylab="Voltage", xlab="datetime", type="l")

# Plot 3
plot(febData$TimeStamp, febData$Sub_metering_1, ylab="Energy sub metering",  xlab="", type="l")
lines(febData$TimeStamp, febData$Sub_metering_2, col="red", type="l")
lines(febData$TimeStamp, febData$Sub_metering_3, col="blue", type="l")
legend("topright", lwd=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , bty = "n")

# Global_reactive_power chart
plot(febData$TimeStamp, febData$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")

dev.off()


