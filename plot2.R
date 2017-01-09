#import data
dataset <- read.table("household_power_consumption.txt", header=TRUE, sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?")
#get required subset - 2 day data
data <- subset(dataset,dataset$Date=="1/2/2007"|dataset$Date=="2/2/2007")
#convert Date and Time column to one DateTime column
data$Datetime <-paste(data$Date, data$Time)
#plot Global Active Power for given days
png("plot2.png", width=480, height=480)
plot(strptime(data$Datetime, "%d/%m/%Y %H:%M:%S"), data$Global_active_power, type="l", xlab="",ylab="Global Active Power(Kilowatts)" )
dev.off()