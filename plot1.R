##Get dataset
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 2075259)


##Get data from 01/02/2007 - 02/02/2007
date_needed <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

##Convert Date and Time variables to Date/Time classes
converted_date<- as.Date(c("1/2/2007", "2/2/2007"), format="%d/%m/%Y")

##Make histogram and save it as a png file
png(filename = 'plot1.png', height=480, width=480)
hist(date_needed$Global_active_power, main= "Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
dev.off()
