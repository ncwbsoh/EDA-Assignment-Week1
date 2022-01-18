#Setup for Data
Data = read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", "double", "double", "double", "double", "double", "double", "double"), na.strings = "?")
Data$Date = as.Date(Data$Date, "%d/%m/%Y")
Data$Time = strptime(Data$Time,"%H:%M:%S")
Data = (subset(Data, Date >= as.Date("01/02/2007", "%d/%m/%Y") & Date <= as.Date("02/02/2007", "%d/%m/%Y")))

#Actual Plotting
hist(Data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()