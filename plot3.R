source("getdata.R")
data <- getdata("1/2/2007","2/2/2007")

data <- processdata(data)

png(file="./graphs/plot3.png",width=504,height=504)
par(mfrow = c(1,1)) 
plot(data$DateTime, data$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "") 

lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col= "red")
lines(data$DateTime, data$Sub_metering_3, col= "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), col = c("black","red", "blue"))
dev.off()