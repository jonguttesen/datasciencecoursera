library(lubridate)

data <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE )
data$DateTime <- as_datetime( strptime( paste(data$Date, data$Time, sep=" ") , "%d/%m/%Y %H:%M:%S"))
data <- data[(year(data$DateTime) == 2007 & month(data$DateTime) == 2 & (day(data$DateTime) == 1 | day(data$DateTime) == 2)),]
data$Global_active_power <- as.double(data$Global_active_power)

par(mfrow=c(2,2))

plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")

plot(data$DateTime, data$Voltage, type = "l", ylab = "Voltage", xlab="datetime")

plot(data$DateTime, data$Sub_metering_1, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")
lines(data$DateTime, data$Sub_metering_2, type = "l", col="red"  )
lines(data$DateTime, data$Sub_metering_3, type = "l", col="blue"  )
legend( "topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1 )

plot(data$DateTime, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab="datetime")
