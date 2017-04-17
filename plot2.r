library(lubridate)
data <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE )
data$DateTime <- as_datetime( strptime( paste(data$Date, data$Time, sep=" ") , "%d/%m/%Y %H:%M:%S"))

data <- data[(year(data$DateTime) == 2007 & month(data$DateTime) == 2 & (day(data$DateTime) == 1 | day(data$DateTime) == 2)),]

data$Global_active_power <- as.double(data$Global_active_power)
hist(data[,"Global_active_power"],col = "Red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power" )
plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")