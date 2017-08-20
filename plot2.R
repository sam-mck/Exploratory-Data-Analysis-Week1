## Get Data
data <- file("household_power_consumption.txt")
data2 <- read.table(text = grep("^[1,2]/2/2007", readLines(data), value = TRUE),
                    col.names = c("Date", "Time", "Global_active_power",
                                  "Global_reactive_power", "Voltage", "Global_intensity", 
                                  "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                    sep = ";", header = TRUE, na.strings = "?")

##Create png file
png(filename='plot2.png', width=480, height=480, units='px')

## Create Date/Time field
data2$Date <- as.Date(data2$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(data2$Date), data2$Time) 
data2$Datetime <- as.POSIXct(datetime)

## Create plot2
plot(data2$Global_active_power~data2$Datetime,type="l",ylab="Global Active Power (kilowatts)",xlab="")

##Dev off
dev.off()