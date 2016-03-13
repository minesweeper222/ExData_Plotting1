dataFileName <- "data\\household_power_consumption.txt"

powerData <- read.table(dataFileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#head(powerData)
subData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007"),]

#head(subData)

globalActivePower <- as.numeric(subData$Global_active_power)

png("plot1.png", width=480, height=480)

#create histogram
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#shutdown graphic device
dev.off()
