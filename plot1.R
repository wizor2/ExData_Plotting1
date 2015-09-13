sourceData <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)
sourceData$Date <- as.Date(as.character(sourceData$Date), format = "%d/%m/%Y")

dateData <- subset(sourceData, Date >= "2007-02-01" & Date <= "2007-02-02")
dateData$Global_active_power <- as.numeric(as.character(dateData$Global_active_power))

png(file = "plot1.png")
hist(dateData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Power Active (kilowatts)")
dev.off()
