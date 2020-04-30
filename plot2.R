#File: plot2.R 

#download the file - The download will be done only in the first .R file. For all the other only the read_file will be considered.

#link <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(link, destfile = "power_consumption.zip")
#unzip(zipfile = "power_consumption.zip")

library("dplyr")
library("lubridate")


power.txt <- read.csv("household_power_consumption.txt", sep = ";"
                      , header = TRUE, na.strings="?")

power.txt$Date <- as.POSIXct(paste(power.txt$Date, power.txt$Time), format="%d/%m/%Y %H:%M:%S")

glimpse(power.txt)

plot2 <-power.txt %>% 
  select(Date, Global_active_power) %>%
  filter(power.txt$Date >= "2007-02-01" & power.txt$Date < " 2007-02-03")

glimpse(plot2)

png("plot2.png", width=480, height=480)


plot(x = plot2$Date
     , y = plot2$Global_active_power
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
