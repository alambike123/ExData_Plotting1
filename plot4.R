#File: plot4.R 

#download the file - The download will be done only in the first .R file. For all the other only the read_file will be considered.

#link <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(link, destfile = "power_consumption.zip")
#unzip(zipfile = "power_consumption.zip")

library("dplyr")

power.txt <- read.csv("household_power_consumption.txt", sep = ";"
                      , header = TRUE, na.strings="?")

power.txt$Date <- as.POSIXct(paste(power.txt$Date, power.txt$Time), format="%d/%m/%Y %H:%M:%S")

glimpse(power.txt)


plot <-power.txt %>% 
  filter(power.txt$Date >= "2007-02-01" & power.txt$Date < " 2007-02-03")

glimpse(plot)

png("plot4.png", width=480, height=480)

# Plot 4 graphs together
par(mfrow=c(2,2))

# 01

plot(plot$Date, plot$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# 02

plot(plot$Date,plot$Voltage, type="l", xlab="datetime", ylab="Voltage")

# 03

plot( x = plot$Date, y= plot$Sub_metering_1 , type="l", xlab="", ylab="Energy sub metering")
lines(x = plot$Date, y= plot$Sub_metering_2 , col="red")
lines(x = plot$Date, y= plot$Sub_metering_3 ,col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

# 04

plot(plot$Date, plot$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.off()
