mydata = read.table("household_power_consumption.txt",  na.strings = "?", sep = ";", header=T)
x <- mydata[mydata$Date %in% c('1/2/2007', '2/2/2007'), ]
mydata <- NULL

png("plot1.png", 480, 480)
hist(x$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)", col="darkorange1")

dev.off()
