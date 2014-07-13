download.file('http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',
              'household_power_consumption.zip')
unzip('household_power_consumption.zip')

library(sqldf)
data <- read.csv.sql(file="household_power_consumption.txt",
                     sql="select * from file where Date='1/2/2007' or Date='2/2/2007'", sep=';')
data$Date <- strptime(data$Date, format='%d/%m/%Y')

# Plot 1
png('plot1.png')
hist(data$Global_active_power, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)')
dev.off()
