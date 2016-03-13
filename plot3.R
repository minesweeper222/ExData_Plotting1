dataFileName <- "data\\household_power_consumption.txt"

powerData <- read.table(dataFileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#head(powerData)
subData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007"),]

#head(subData)

day <- strptime(paste(subData$Date,subData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(subData$Global_active_power)

sub_metering_1 <- as.numeric(subData$Sub_metering_1)
sub_metering_2 <- as.numeric(subData$Sub_metering_2)
sub_metering_3 <- as.numeric(subData$Sub_metering_3)

png("plot3.png", width=480, height=480)

#create line plot 1 for sub metering 1
plot(day, sub_metering_1, type="l", ylab="Energy Submetering", xlab="")

#create line plot 1 for sub metering 2
lines(day, sub_metering_2, type="l", col="red")

#create line plot 1 for sub metering 3
lines(day, sub_metering_3, type="l", col="blue")

#add legend for sub metering
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#shutdown graphic device
dev.off()

