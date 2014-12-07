setwd("~/Desktop/coursera/Exploratory Data Analysis/Week 1/assignment")
inputData <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, header=TRUE, na.strings="?")
data <- inputData
data$TimeStamp <- strptime(paste(data$Date, data$Time), format= "%d/%m/%Y %H:%M:%S")
febData <- subset(data, TimeStamp>=as.POSIXct("2007-02-01 00:00:00") & 
                    TimeStamp < as.POSIXct("2007-02-03 00:00:00"))

png(file="plot2.png", width=480, height=480)
plot(febData$TimeStamp, febData$Global_active_power, ylab="Global Active Power (kilowatts)",  xlab="", type="l")
dev.off()


