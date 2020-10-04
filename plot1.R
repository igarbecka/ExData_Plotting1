# Loading needed packages
library(sqldf)

# Loading a subset of data
dataFile <- file("household_power_consumption.txt")
data <- sqldf("select * from dataFile where Date in('1/2/2007', '2/2/2007')", 
              file.format = list(header = TRUE, sep = ";"))
close(dataFile)

# Creating plot 1
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

# Copy plot 1 to a PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()