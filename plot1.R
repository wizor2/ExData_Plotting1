## read data from file to table and change class for Date variable in table
sourceData <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)
sourceData$Date <- as.Date(as.character(sourceData$Date), format = "%d/%m/%Y")

## create new table from original according project conditions and change class for Global_active_power variable
dateData <- subset(sourceData, Date >= "2007-02-01" & Date <= "2007-02-02")
dateData$Global_active_power <- as.numeric(as.character(dateData$Global_active_power))

## write histogram in file 'plot1.png'
png(file = "plot1.png")
hist(dateData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Power Active (kilowatts)")
dev.off()
