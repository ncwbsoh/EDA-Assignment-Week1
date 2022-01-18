#Setup for Data
Data = read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", "double", "double", "double", "double", "double", "double", "double"), na.strings = "?")
Data$Time = strptime(paste(Data$Date, Data$Time), "%d/%m/%Y %H:%M:%S")
Data$Date = as.Date(Data$Date, "%d/%m/%Y")
Data = (subset(Data, Date >= as.Date("01/02/2007", "%d/%m/%Y") & Date <= as.Date("02/02/2007", "%d/%m/%Y")))

#Actual Plotting
par (mfrow = c(2,2))

plot(Data$Time, Data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(Data$Time, Data$Voltage, type = "l", xlab = "datetime")

with(Data,{ 
plot(Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(Time, Sub_metering_2, col = "red")
lines(Time, Sub_metering_3, col = "blue")
legend("topright", lty = 1, bty = "n",  col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

plot(Data$Time, Data$Global_reactive_power, type = "l", xlab = "datetime")

#Creating the png
dev.copy(png, file = "plot4.png")
dev.off()