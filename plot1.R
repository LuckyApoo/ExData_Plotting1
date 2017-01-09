#import data
dataset <- read.table("household_power_consumption.txt", header=TRUE, sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?")
#get required subset - 2 day data
data <- subset(dataset,dataset$Date=="1/2/2007"|dataset$Date=="2/2/2007")
#plot histogram
png("plot1.png", width=480, height=480)
hist(data$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power")
dev.off()