# Loading needed packages
library(sqldf)

# Loading a subset of data
dataFile <- file("household_power_consumption.txt")
data <- sqldf("select * from dataFile where Date in('1/2/2007', '2/2/2007')", 
              file.format = list(header = TRUE, sep = ";"))
close(dataFile)

# Coercing Date column from character string
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Creating plot 2
plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")

# Copy plot 2 to a PNG file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()