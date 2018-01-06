##Change language
Sys.setlocale("LC_TIME", "C")

##Get dataset
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 2075259)


##Get data from 01/02/2007 - 02/02/2007
date_needed <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

##Conversion in classes
converted_date<- as.Date(converted_date, format="%d/%m/%Y")
date_time <- strptime(paste(date_needed$Date, date_needed$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
global_active_power <- as.numeric(date_needed$Global_active_power)


##Make plot and save it as a png file
png(filename = 'plot2.png', height=480, width=480)
plot((date_time),global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
