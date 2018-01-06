##Change language of Rstudio temporarily
Sys.setlocale("LC_TIME", "C")

##Get dataset
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 2075259)


##Get data from 01/02/2007 - 02/02/2007
date_needed <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

##Conversion in classes
converted_date<- as.Date(converted_date, format="%d/%m/%Y")
date_time <- strptime(paste(date_needed$Date, date_needed$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
SM1 <- as.numeric(date_needed$Sub_metering_1)
SM2 <- as.numeric(date_needed$Sub_metering_2)
SM3 <- as.numeric(date_needed$Sub_metering_3)


##Make plot and save it as a png file
png(filename = 'plot3.png', height=480, width=480)
plot(date_time, SM1, type="l", ylab="Energy sub metering", xlab="")
lines(date_time, SM2, type = "l", col="red")
lines(date_time, SM3, type= "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red","blue"),bty = "o")
dev.off()
