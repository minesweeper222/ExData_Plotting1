dataFileName <- "data\\household_power_consumption.txt"

powerData <- read.table(dataFileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#head(powerData)
subData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007"),]

#head(subData)

day <- strptime(paste(subData$Date,subData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(subData$Global_active_power)

png("plot2.png", width=480, height=480)

#create line plot 
plot(day, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#shutdown graphic device
dev.off()
