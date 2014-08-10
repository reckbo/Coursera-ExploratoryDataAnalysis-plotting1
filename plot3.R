d <- read.csv('household_power_consumption.txt', sep=";", na.strings="?")
d <- transform(d, DateTime=strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")) 
s <- d[d$DateTime >= as.POSIXct('2007-02-01') & d$DateTime < as.POSIXct('2007-02-03'),]
png(filename="plot3.png")
plot(s$DateTime, s$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(s$DateTime, s$Sub_metering_2, col='red')
lines(s$DateTime, s$Sub_metering_3, col='blue')
legend('topright', 
       col=c('black', 'red', 'blue'), 
       lty=c(1,1,1),
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()