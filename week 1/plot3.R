setwd("~/Desktop/coursera/Exploratory Data Analysis/Week 1/assignment")
inputData <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, header=TRUE, na.strings="?")
data <- inputData
data$TimeStamp <- strptime(paste(data$Date, data$Time), format= "%d/%m/%Y %H:%M:%S")
febData <- subset(data, TimeStamp>=as.POSIXct("2007-02-01 00:00:00") & 
                    TimeStamp < as.POSIXct("2007-02-03 00:00:00"))

png(file="plot3.png", width=480, height=480)
plot(febData$TimeStamp, febData$Sub_metering_1, ylab="Energy sub metering",  xlab="", type="l")
lines(febData$TimeStamp, febData$Sub_metering_2, col="red", type="l")
lines(febData$TimeStamp, febData$Sub_metering_3, col="blue", type="l")
legend("topright", lwd=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


