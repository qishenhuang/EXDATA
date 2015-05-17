mydata = read.table("household_power_consumption.txt",  na.strings = "?", sep = ";", header=T)
x <- mydata[mydata$Date %in% c('1/2/2007', '2/2/2007'), ]
mydata <- NULL

x$datetime <- paste(x$Date, x$Time)
x$datetime <- strptime(x$datetime, "%d/%m/%Y %H:%M:%S")
x$Date <- NULL
x$Time <- NULL

png("plot2.png", 480, 480)

plot(x$datetime, x$Global_active_power, type="l",  xaxt='n', ylab="Global Active Power (kilowatts)", xlab='') 
at <- c(ISOdate(2007,2,1), ISOdate(2007,2,2))
axis(side=1, at = at, labels=weekdays(at))

dev.off()
