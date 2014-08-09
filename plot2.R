d <- read.csv('household_power_consumption.txt', sep=";", na.strings="?")
d <- transform(d, DateTime=strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")) 
s <- d[d$DateTime >= as.POSIXct('2007-02-01') & d$DateTime < as.POSIXct('2007-02-03'),]
png(filename="plot2.png")
plot(s$DateTime, s$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(s$DateTime, s$Global_active_power)
dev.off()