mydata = read.table("household_power_consumption.txt",  na.strings = "?", sep = ";", header=T)
x <- mydata[mydata$Date %in% c('1/2/2007', '2/2/2007'), ]
mydata <- NULL

x$datetime <- paste(x$Date, x$Time)
x$datetime <- strptime(x$datetime, "%d/%m/%Y %H:%M:%S")
x$Date <- NULL
x$Time <- NULL

png("plot3.png", 480, 480)

ylim <- range( x$Sub_metering_1,  x$Sub_metering_2,  x$Sub_metering_3)
plot(x$datetime, x$Sub_metering_1, type="l", ylim=ylim, xaxt='n', ylab="Energy Sub Metering", xlab='')
lines(x$datetime, x$Sub_metering_1, type="l", col=2)
lines(x$datetime, x$Sub_metering_2, type="l", col=3)
lines(x$datetime, x$Sub_metering_3, type="l", col=4)

legend('topright', c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),  lty=1, col=c(2, 3, 4), bty='n', cex=.75)

at <- c(ISOdate(2007,2,1), ISOdate(2007,2,2))
axis(side=1, at = at, labels=weekdays(at))

dev.off()
