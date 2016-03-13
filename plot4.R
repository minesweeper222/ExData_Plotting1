dataFileName <- "data\\household_power_consumption.txt"

powerData <- read.table(dataFileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#head(powerData)
subData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007"),]

#head(subData)

day <- strptime(paste(subData$Date,subData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(subData$Global_active_power)

globalReactivePower <- as.numeric(subData$Global_reactive_power)

voltage <- as.numeric(subData$Voltage)

sub_metering_1 <- as.numeric(subData$Sub_metering_1)
sub_metering_2 <- as.numeric(subData$Sub_metering_2)
sub_metering_3 <- as.numeric(subData$Sub_metering_3)

png("plot4.png", width=480, height=480)

#defind to create 4 plots
par(mfrow = c(2, 2))

#first plot for global active power at c(1,0)
plot(day, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#second plot for Voltage at c(1,1)
plot(day, voltage, type="l", xlab="datetime", ylab="Voltage")

#third plot for Submetering at c(2,1)
plot(day, sub_metering_1, type="l", ylab="Energy Submetering", xlab="")

lines(day, sub_metering_2, type="l", col="red")

lines(day, sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#fourth plot for Global reactive power at c(2,2)
plot(day, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

#shutdown graphic device
dev.off()
