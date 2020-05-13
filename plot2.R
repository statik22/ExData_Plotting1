#reading data from the file
#data is subsetted according to required dates during the read from the file
data <- subset(read.table("household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE), Date == "1/2/2007" | Date == "2/2/2007")

#adding a new column by concatenating date and time columns and operating with strptime to convert
data1 <- transform(data, Date_time =strptime(paste(data$Date, data$Time), format ="%d/%m/%Y %H:%M:%S"))

#Opening the png device
png("plot2.png")

#writing the graph to the device
#the days on x axis are in swedish tor = Torsdag(Thursday) fre = Fredag(Friday) lör = Lördag(Saturday)
plot(data1$Date_time, data1$Global_active_power, type = "l", xlab = "" , ylab = "Global Active Power(kilowatts)")

#closing the device
dev.off()