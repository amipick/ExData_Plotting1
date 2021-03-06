rm(list=ls())
data <- read.table("household_power_consumption.txt",header= TRUE, sep =';', colClasses = "character", na.strings = "?")
df <- subset(data, as.Date(data$Date, "%d/%m/%Y") >= '2007-02-01' & as.Date(data$Date, "%d/%m/%Y") <= '2007-02-02')
rm(data)
datetime <- paste(as.Date(df$Date, "%d/%m/%Y"), df$Time)
df$Datetime <- as.POSIXct(datetime)
cols = c(3:9)
df[, cols] <- apply(df[,cols], 2, function(x) as.numeric(as.character(x)))
png(file="plot3.png",width=480,height=480, units= 'px')
plot(df$Sub_metering_1 ~ df$Datetime, type = "l",ylab = "Energy sub metering", xlab = "")
lines(df$Sub_metering_2 ~ df$Datetime, col= "red")
lines(df$Sub_metering_3 ~ df$Datetime, col= "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, lwd = 1)
dev.off()



