############# GET DATA (all of it) ###############
myData <- read.csv("household_power_consumption.txt", sep = ";")
myData$Date <- as.Date(myData$Date, "%d/%m/%Y")

############# SUBSET DATA ###############
df <- subset(myData, as.Date(myData$Date, "%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(myData$Date, "%d/%m/%Y") <= as.Date("2007-02-02"))
dateTimes <- as.POSIXct(strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S"))

############# FORMAT DATA ###############
df$Global_active_power <- as.numeric(levels(df$Global_active_power))[df$Global_active_power]

############# PLOT DATA ###############
png(filename="plot2.png", width=480, height=480)
plot(dateTimes, df$Global_active_power, type="l", lwd = 1, xlab="", ylab="Global Active Power (kilwatts)")
dev.off()
