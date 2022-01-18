#Setup for Data
Data = read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", "double", "double", "double", "double", "double", "double", "double"), na.strings = "?")
Data$Time = strptime(paste(Data$Date, Data$Time), "%d/%m/%Y %H:%M:%S")
Data$Date = as.Date(Data$Date, "%d/%m/%Y")
Data = (subset(Data, Date >= as.Date("01/02/2007", "%d/%m/%Y") & Date <= as.Date("02/02/2007", "%d/%m/%Y")))

#Actual Plotting
with(Data, plot(Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(Data, lines(Time, Sub_metering_2, col = "red"))
with(Data, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Creating the png
dev.copy(png, file = "plot3.png")
dev.off()