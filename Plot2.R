library(data.table)
getwd

# data downloaded and saved in working directory (getwd) from url:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# only use data for 1/2/2007 and 2/2/2007
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


# plot 2

#make sure the thousand separator is interpreted correctly: (else there will be an error message), use "as.numeric"

globalActivePower <- as.numeric(subSetData$Global_active_power)

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()