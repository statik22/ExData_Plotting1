#reading data from the file
#data is subsetted according to required dates during the read from the file
data <- subset(read.table("household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE), Date == "1/2/2007" | Date == "2/2/2007")

#adding a new column by concatenating date and time columns and operating with strptime to convert
data1 <- transform(data, Date_time =strptime(paste(data$Date, data$Time), format ="%d/%m/%Y %H:%M:%S"))

#Opening the png device
png("plot3.png")

#writing the graph to the device
#the days on x axis are in swedish tor = Torsdag(Thursday) fre = Fredag(Friday) lör = Lördag(Saturday)

#Writing the first graph with sub_metering_1 on Y axis
with(data1, plot(data1$Date_time, y = data1$Sub_metering_1, type = "l", xlab ="", ylab = "Energy sub metering"))

#Adding sub_metering_2 and sub_metering_3
with(data1, lines(data1$Date_time, y = data1$Sub_metering_2, col = "red"))
with(data1, lines(data1$Date_time, y = data1$Sub_metering_3, col = "blue"))

#Adding the required legend
legend("topright", lty =1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#closing the device
dev.off()