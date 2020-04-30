#File: plot3.R 

#download the file - The download will be done only in the first .R file. For all the other only the read_file will be considered.

#link <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(link, destfile = "power_consumption.zip")
#unzip(zipfile = "power_consumption.zip")

library("dplyr")


power.txt <- read.csv("household_power_consumption.txt", sep = ";"
                      , header = TRUE, na.strings="?")

power.txt$Date <- as.POSIXct(paste(power.txt$Date, power.txt$Time), format="%d/%m/%Y %H:%M:%S")

glimpse(power.txt)

plot3 <-power.txt %>% 
  select(Date, Sub_metering_1, Sub_metering_2, Sub_metering_3) %>%
  filter(power.txt$Date >= "2007-02-01" & power.txt$Date < " 2007-02-03")

glimpse(plot3)

png("plot3.png", width=480, height=480)

plot( x = plot3$Date, y= plot3$Sub_metering_1 , type="l", xlab="", ylab="Energy sub metering")
lines(x = plot3$Date, y= plot3$Sub_metering_2 , col="red")
lines(x = plot3$Date, y= plot3$Sub_metering_3 ,col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()