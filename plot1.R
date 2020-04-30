#File: plot1.R 

#download the file - The download will be done only in the first .R file. For all the other only the read_file will be considered.

link <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(link, destfile = "power_consumption.zip")
unzip(zipfile = "power_consumption.zip")

library("data.table")
library("dplyr")
library("ggplot2")

power.txt <- read.csv("household_power_consumption.txt", sep = ";"
                      , header = TRUE, na.strings="?")

power.txt$Date1 <-as.Date(power.txt$Date,"%d/%m/%Y")

plot1 <-power.txt %>% 
  select(Global_active_power) %>%
  filter(power.txt$Date1 >= "2007-02-01" & power.txt$Date1 <= "2007-02-02")

png("plot1.png", width=480, height=480)

hist(x = plot1$Global_active_power,main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()


