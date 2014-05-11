source("getdata.R")
data <- getdata("1/2/2007","2/2/2007")
data <- processdata(data) 

png(file="./graphs/plot2.png",width=504,height=504)
plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()