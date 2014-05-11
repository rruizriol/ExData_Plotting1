source("getdata.R")
data <- getdata("1/2/2007","2/2/2007")
data <- processdata(data)

png("./graphs/plot1.png", width = 504, height = 504)
hist(data$Global_active_power, col="red",
     main = "Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()