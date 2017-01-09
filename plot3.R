#import data
dataset <- read.table("household_power_consumption.txt", header=TRUE, sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?")
#get required subset - 2 day data
data <- subset(dataset,dataset$Date=="1/2/2007"|dataset$Date=="2/2/2007")
#convert Date and Time column to one DateTime column
data$Datetime <-paste(data$Date, data$Time)
#plot the three sub meter readings
png("plot3.png", width=480, height=480)
plot(strptime(data$Datetime, "%d/%m/%Y %H:%M:%S"), data$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
lines(strptime(data$Datetime, "%d/%m/%Y %H:%M:%S"), data$Sub_metering_2, type="l", col="red")
lines(strptime(data$Datetime, "%d/%m/%Y %H:%M:%S"), data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"), col=c("black","red","blue"), lty=1, cex=0.75, box.lwd=.5)
dev.off()