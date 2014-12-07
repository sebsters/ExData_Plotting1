setwd("~/Desktop/coursera/Exploratory Data Analysis/Week 1/assignment")
inputData <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, header=TRUE, na.strings="?")
inputData$Date <- as.Date(inputData$Date, "%d/%m/%Y")
febData <- subset(inputData, Date>=as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
png(file="plot1.png", width=480, height=480)
hist(febData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

