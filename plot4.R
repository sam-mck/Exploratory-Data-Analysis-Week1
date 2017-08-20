## Get Data
data <- file("household_power_consumption.txt")
data2 <- read.table(text = grep("^[1,2]/2/2007", readLines(data), value = TRUE),
                    col.names = c("Date", "Time", "Global_active_power",
                                  "Global_reactive_power", "Voltage", "Global_intensity", 
                                  "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                    sep = ";", header = TRUE, na.strings = "?")
##Create png file
png(filename='plot4.png', width=480, height=480, units='px')

## Create Date/Time field
data2$Date <- as.Date(data2$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(data2$Date), data2$Time) 
data2$Datetime <- as.POSIXct(datetime)

## Setup window
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

## Plot1
plot(data2$Global_active_power~data2$Datetime,type="l",xlab="",ylab="Global Active Power")

## Plot2
plot(data2$Voltage~data2$Datetime,type="l",ylab="Voltage",xlab="datetime" )

##Create Plot3
plot(data2$Sub_metering_1~data2$Datetime,type="l",ylab="Energy sub metering",xlab="")
points(data2$Sub_metering_2~data2$Datetime,type="l",col="red")
points(data2$Sub_metering_3~data2$Datetime,type="l",col="blue") 
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)


## Plot4
plot(data2$Global_reactive_power~data2$Datetime,type="l",ylab="global_reactive_power",xlab="datetime")

## Dev off
dev.off()