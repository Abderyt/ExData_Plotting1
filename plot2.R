download.file('http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',
              'household_power_consumption.zip')
unzip('household_power_consumption.zip')

library(sqldf)
data <- read.csv.sql(file="household_power_consumption.txt",
                     sql="select * from file where Date='1/2/2007' or Date='2/2/2007'", sep=';')
data$Date <- strptime(data$Date, format='%d/%m/%Y')

# Plot 2
png('plot2.png')
plot(data$Global_active_power, type='l', xaxt='n', yaxt='n', ylab='Global Active Power (kilowatts)', xlab='')
axis(1, c(1, nrow(data)/2, nrow(data)), c('Thu', 'Fri', 'Sat'))
axis(2, pretty(data$Global_active_power))
dev.off()
