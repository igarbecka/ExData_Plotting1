# Loading needed packages
library(sqldf)

# Loading a subset of data
dataFile <- file("household_power_consumption.txt")
data <- sqldf("select * from dataFile where Date in('1/2/2007', '2/2/2007')", 
              file.format = list(header = TRUE, sep = ";"))
close(dataFile)

# Coercing Date column from character string
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Creating plot 3
plot(data$DateTime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Copy plot 3 to a PNG file
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()