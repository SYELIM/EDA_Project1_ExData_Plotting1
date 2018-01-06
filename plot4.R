##Change language of Rstudio temporarily
Sys.setlocale("LC_TIME", "C")

##Get dataset
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 2075259)


##Get data from 01/02/2007 - 02/02/2007
date_needed <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

##Conversion in classes
converted_date<- as.Date(c("1/2/2007", "2/2/2007"), format="%d/%m/%Y")
date_time <- strptime(paste(date_needed$Date, date_needed$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
global_active_power <- as.numeric(date_needed$Global_active_power)
SM1 <- as.numeric(date_needed$Sub_metering_1)
SM2 <- as.numeric(date_needed$Sub_metering_2)
SM3 <- as.numeric(date_needed$Sub_metering_3)
Vol <- as.numeric(date_needed$Voltage)
reactive <- as.numeric(date_needed$Global_reactive_power)

##Make plots and save in png file
png(filename = 'plot4.png', height=480, width=480)
par(mfrow=c(2,2), mar=c(5.1,4.1,4.1,2.1), oma = c(0, 0, 2, 0))
with(date_time,{
        ##Date vs. Global Active Power
        plot((date_time),global_active_power, type="l", xlab="", ylab="Global Active Power")
        
        ##datetime vs.Voltage
        plot((date_time),Vol, type="l", xlab="datetime", ylab="Voltage")
        
        ##Date vs. Energy sub metering
        plot(date_time, SM1, type="l", ylab="Energy sub metering", xlab="")
        lines(date_time, SM2, type = "l", col="red")
        lines(date_time, SM3, type= "l", col="blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, lwd=2, col=c("black", "red","blue"), bty = "n")
        
        ##datetime vs. Global_reactive_power
        plot((date_time), reactive, type="l", xlab="datetime", ylab="Global_reactive_power")
        
})
dev.off()

