download.file('http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',
              'household_power_consumption.zip')
unzip('household_power_consumption.zip')

library(sqldf)
data <- read.csv.sql(file="household_power_consumption.txt",
                     sql="select * from file where Date='1/2/2007' or Date='2/2/2007'", sep=';')
data$Date <- strptime(data$Date, format='%d/%m/%Y')

# Plot 3
png('plot3.png')
plot(with(data, pmax(Sub_metering_1, Sub_metering_2, Sub_metering_3)), type='n', xaxt='n', xlab='', ylab='Energy sub metering')
axis(1, c(1, nrow(data)/2, nrow(data)), c('Thu', 'Fri', 'Sat'))
lines(data$Sub_metering_1, col=1)
lines(data$Sub_metering_2, col=2)
lines(data$Sub_metering_3, col=4)
legend("topright", c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c(1,2,4), lwd=1, cex=.9)
dev.off()
