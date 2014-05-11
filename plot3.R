############# GET DATA (all of it) ###############
myData <- read.csv("household_power_consumption.txt", sep = ";")
myData$Date <- as.Date(myData$Date, "%d/%m/%Y")

############# SUBSET DATA ###############
df <- subset(myData, as.Date(myData$Date, "%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(myData$Date, "%d/%m/%Y") <= as.Date("2007-02-02"))
df$dateTimes <- as.POSIXct(strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S"))

############# FORMAT DATA ###############
df$Sub_metering_1 <- as.numeric(levels(df$Sub_metering_1))[df$Sub_metering_1]
df$Sub_metering_2 <- as.numeric(levels(df$Sub_metering_2))[df$Sub_metering_2]
# No 3 is already numeric.

############# PLOT DATA ###############
png(filename="plot3.png", width=480, height=480)
plot(df$dateTimes, df$Sub_metering_1, type="l", col="black", yaxt="n", xlab="", ylab="Energy sub metering")
lines(df$dateTimes, df$Sub_metering_2, col="red")
lines(df$dateTimes, df$Sub_metering_3, col="blue")
axis(2, at=seq(0, 30, length=4))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col=c("black","red","blue"))
dev.off()