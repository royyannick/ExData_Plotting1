############# GET DATA (all of it) ###############
myData <- read.csv("household_power_consumption.txt", sep = ";")
myData$Date <- as.Date(myData$Date, "%d/%m/%Y")

############# SUBSET DATA ###############
y <- subset(myData, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

############# FORMAT DATA ###############
y$Global_active_power <- as.numeric(levels(y$Global_active_power))[y$Global_active_power]

############# PLOT DATA ###############
png(filename="plot1.png", width=480, height=480)
hist(y$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()