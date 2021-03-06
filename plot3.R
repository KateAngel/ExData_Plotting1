data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
head(data)
d<-subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")
d$datetime <- as.POSIXct(paste(as.Date(d$Date, format="%d/%m/%Y"), d$Time), "%d/%m/%y %H:%M:%S")
d$subMetering1 <- as.numeric(as.character(d$Sub_metering_1))
d$subMetering2 <- as.numeric(as.character(d$Sub_metering_2))
d$subMetering3 <- as.numeric(as.character(d$Sub_metering_3))
png("plot3.png", width=480, height=480)
plot(d$datetime, d$subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(d$datetime, d$subMetering2, type="l", col="red")
lines(d$datetime, d$subMetering3, type="l", col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))
dev.off()
