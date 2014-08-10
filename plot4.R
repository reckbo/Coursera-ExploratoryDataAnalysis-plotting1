d <- read.csv('household_power_consumption.txt', sep=";", na.strings="?")
d <- transform(d, datetime=strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")) 
s <- d[d$datetime >= as.POSIXct('2007-02-01') & d$datetime < as.POSIXct('2007-02-03'),]
png(filename="plot4.png")
par(mfrow=c(2,2))
with(s, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
with(s, plot(datetime, Voltage, type="l"))
with(s, plot(datetime, Sub_metering_1, type='l', xlab="", ylab="Energy sub metering"))
with(s, lines(datetime, Sub_metering_2, col='red'))
with(s, lines(datetime, Sub_metering_3, col='blue'))
legend('topright', 
       col=c('black', 'red', 'blue'), 
       lty=c(1,1,1),
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       bty='n')
with(s, plot(datetime, Global_reactive_power, type='l'))
dev.off()