## Getting full dataset
ip <- read.csv("E:\\College_Work\\CourseEra\\DataScience\\EDA\\Exercise 1\\exdata_2Fdata%2Fhousehold_power_consumption\\household_power_consumption.txt", header=T, sep=';', na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
ip$Date <- as.Date(ip$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(ip, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(ip)

## Converting dates
temp <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(temp)

## Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="E:\\College_Work\\CourseEra\\DataScience\\EDA\\ExData_Plotting1\\plot1.png", height=480, width=480)
dev.off()
