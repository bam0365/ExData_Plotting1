# Exploratory Data Analysis - Project 1-plot4

## Reading the data and setting the date format
dataset <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataset$Data <- as.Date(dataset$Date,format="%d/$m/$Y")

## subsetting the data
datasubset_Feb2007 <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007"),]
globalActPwr <- as.numeric(datasubset_Feb2007$Global_active_power)
globalReActPwr <- as.numeric(datasubset_Feb2007$Global_reactive_power)
voltage <- as.numeric(datasubset_Feb2007$Voltage)
#date_tm <- strptime(paste(datasubset_Feb2007$Date,datasubset_Feb2007$Time,sep=" "), "%d/%m/%Y %H:%M:%S")
subMtr1 <- as.numeric(datasubset_Feb2007$Sub_metering_1)
subMtr2 <- as.numeric(datasubset_Feb2007$Sub_metering_2)
subMtr3 <- as.numeric(datasubset_Feb2007$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(date_tm,globalActPwr,type="l",xlab="", ylab="Global Active Power", cex=0.2)
plot(date_tm,voltage,type="l",xlab="datetime",ylab="Voltage")
plot(date_tm,subMtr1,type="l", ylab="Energy SubMetering", xlab="")
lines(date_tm,subMtr2, type="l", col="red")
lines(date_tm,subMtr3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2.5,col=c("black","red","blue"))
plot(date_tm,globalReActPwr,type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
