d <- read.csv('household_power_consumption.txt', sep=";", na.strings="?")
d <- transform(d, Date=as.Date(Date, format="%d/%m/%Y")) 
s <- d[d$Date >= as.Date('2007-02-01') & d$Date < as.Date('2007-02-03'),]
png(filename="plot1.png")
hist(s$Global_active_power, col='red', xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()