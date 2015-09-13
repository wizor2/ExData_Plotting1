sourceData <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)
sourceData$Date <- as.Date(as.character(sourceData$Date), format = "%d/%m/%Y")

dateData <- subset(sourceData, Date >= "2007-02-01" & Date <= "2007-02-02")
dateData$Time <- strptime(as.character(paste(dateData$Date,  dateData$Time)), format = "%Y-%m-%d %H:%M:%S")
dateData$Global_active_power <- as.numeric(as.character(dateData$Global_active_power))

png(file = "plot2.png")
plot(dateData$Time, dateData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()