library(sqldf)
pc <- read.csv.sql("household_power_consumption.txt","select * from file where Date='1/2/2007' OR Date='2/2/2007' ",sep=";")

#pc <- read.csv("household_power_consumption_filtered2.txt",sep=";")
library(lubridate)
pc$Dtstr <- paste(pc$Date, pc$Time)
pc$Date2 <- parse_date_time(pc$Dtstr,"dmy hms")

png(file="plot4.png",width = 480, height=480)

par(mfrow=c(2,2))

# topleft plot
plot(pc$Global_active_power ~ pc$Date2, type="l",ylab="Global Active Power",xlab="")

# topright plot
plot(pc$Voltage ~ pc$Date2, type="l",ylab="Voltage",xlab="datetime")

# bottomleft plot
plot(pc$Sub_metering_1 ~ pc$Date2, type="l",ylab="Energy sub metering",xlab="")
points(pc$Sub_metering_2 ~ pc$Date2, type="l", col="red")
points(pc$Sub_metering_3 ~ pc$Date2, type="l", col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

#bottomright plot
plot(pc$Global_reactive_power ~ pc$Date2, type="l",ylab="Global_reactive_power",xlab="datetime")


dev.off()