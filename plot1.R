# Exploratory Data Analysis - Project 1-plot1

## Reading the data and setting the date format
dataset <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataset$Data <- as.Date(dataset$Date,format="%d/$m/$Y")

## subsetting the data
datasubset_Feb2007 <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007"),]
globalActPwr <- as.numeric(datasubset_Feb2007$Global_active_power)

png("plot1.png", width=480, height=480)
#hist(datasubset_Feb2007$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
hist(globalActPwr, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
