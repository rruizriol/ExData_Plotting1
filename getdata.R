getdata <- function(date1, date2) {
  readdata  <- read.table("../data/household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors =FALSE)
  return(readdata[readdata$Date %in% c(date1,date2) ,])
}

processdata <- function(data) { 
  data[data == "?"] = NA
  
  data$Global_active_power = as.numeric(as.character(data$Global_active_power))
  data$DateTime = (paste(data$Date, data$Time))
  data$DateTime = strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
  
  return(data)
}