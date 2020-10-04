# Loading needed packages
library(sqldf)

# Loading a subset of data
dataFile <- file("household_power_consumption.txt")
data <- sqldf("select * from dataFile where Date in('1/2/2007', '2/2/2007')", 
              file.format = list(header = TRUE, sep = ";"))
close(dataFile)

# Coercing Date column from character string
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Setting graphical parameters
dev.copy(png, file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# Adding Plot 1
plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# Adding Plot 2
plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime")

# Adding Plot 3
plot(data$DateTime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

# Adding Plot 4
plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
