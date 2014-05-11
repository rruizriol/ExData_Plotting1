rawData <- read.table("../data/household_power_consumption.txt", header=F, sep=";", colClasses = "character")
readData <- rawData[grepl("^[12]/2/2007", rawData[,1]),]
readData <- cbind(strptime(paste(readData[,1], readData[,2]), format="%d/%m/%Y %H:%M:%S"), readData[,-c(1,2)])
names(readData) <- c("Date/Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

png(filename="./graphs/plot4.png", width=504, height=504)
par(mfrow=c(2,2))

# first chart
plot(readData$Date, as.numeric(readData$Global_active_power), pch=NA, main="", ylab = "Global Active Power", xlab = "")
lines(readData$Date, as.numeric(readData$Global_active_power))

# second chart
plot(readData$Date, as.numeric(readData$Voltage), pch=NA, main="", ylab = "Voltage", xlab = "datetime")
lines(readData$Date, as.numeric(readData$Voltage))

# third chart
plot(readData$Date, as.numeric(readData$Sub_metering_1), pch=NA, main="", ylab = "Energy sub metering", xlab = "")
# Connect the dots: black is station 1, red is 2, blue is 3
lines(readData$Date, as.numeric(readData$Sub_metering_1), col="black")
lines(readData$Date, as.numeric(readData$Sub_metering_2), col="red")
lines(readData$Date, as.numeric(readData$Sub_metering_3), col="blue")
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1),
       lwd=c(1,1,1),
       col=c("black", "red", "blue"),
       bty="n")#Removes the border around the legend

# four chart
plot(readData$Date, as.numeric(readData$Global_reactive_power), pch=NA, main="", ylab = "Global_reactive_power", xlab = "datetime")
lines(readData$Date, as.numeric(readData$Global_reactive_power))

dev.off()