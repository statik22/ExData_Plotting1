#reading data from the file
#data is subsetted according to required dates during the read from the file
data <- subset(read.table("household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE), Date == "1/2/2007" | Date == "2/2/2007")

#adding a new column by concatenating date and time columns and operating with strptime to convert
data1 <- transform(data, Date_time =strptime(paste(data$Date, data$Time), format ="%d/%m/%Y %H:%M:%S"))

#Opening the png device
png("plot4.png")

#setting mfrow to add multiple graphs
par(mfrow = c(2,2))

#adding graph column 1, row 1
with(data1, plot(data1$Date_time, data1$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l"))

#adding graph column 2, row 1
with(data1, plot(data1$Date_time, data1$Voltage, xlab = "datetime", ylab = "Voltage", type = "l"))

#adding graph column 1, row 2
with(data1, plot(data1$Date_time, y = data1$Sub_metering_1, type = "l", xlab ="", ylab = "Energy sub metering"))
with(data1, lines(data1$Date_time, y = data1$Sub_metering_2, col = "red"))
with(data1, lines(data1$Date_time, y = data1$Sub_metering_3, col = "blue"))
legend("topright", lty =1, col = c("black","red", "blue"), bty = "n" , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#adding graph column 2, row 2
with(data1, plot(data1$Date_time, data1$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l"))

#closing the device
dev.off()