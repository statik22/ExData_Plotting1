#reading data from the file
#data is subsetted according to required dates during the read from the file
data <- subset(read.table("household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE), Date == "1/2/2007" | Date == "2/2/2007")

#Opening the png device
png("plot1.png")

#writing the graph to the device
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", col ="red", main = "Global Acive Power")

#closing the device
dev.off()