############# GET DATA (all of it) ###############
myData <- read.csv("household_power_consumption.txt", sep = ";")
myData$Date <- as.Date(myData$Date, "%d/%m/%Y")

############# SUBSET DATA ###############
df <- subset(myData, as.Date(myData$Date, "%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(myData$Date, "%d/%m/%Y") <= as.Date("2007-02-02"))
df$dateTimes <- as.POSIXct(strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S"))

############# FORMAT DATA ###############
df$Voltage <- as.numeric(levels(df$Voltage))[df$Voltage]
df$Global_reactive_power <- as.numeric(levels(df$Global_reactive_power))[df$Global_reactive_power]
df$Sub_metering_1 <- as.numeric(levels(df$Sub_metering_1))[df$Sub_metering_1]
df$Sub_metering_2 <- as.numeric(levels(df$Sub_metering_2))[df$Sub_metering_2]

############# PREPARE PLOT ###############
png(filename="plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

############# PLOT 1 ###############
plot(df$dateTimes, df$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")

############# PLOT 2 ###############
plot(df$dateTimes, df$Voltage, type="l", col="black", xlab="datetime", ylab ="Voltage")

############# PLOT 3 ###############
plot(df$dateTimes, df$Sub_metering_1, type="l", col="black", yaxt="n", xlab="", ylab="Energy sub metering")
lines(df$dateTimes, df$Sub_metering_2, col="red")
lines(df$dateTimes, df$Sub_metering_3, col="blue")
axis(2, at=seq(0, 30, length=4))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col=c("black","red","blue"))

############# PLOT 4 ###############
plot(df$dateTimes, df$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")

dev.off()