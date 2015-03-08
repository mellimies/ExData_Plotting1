library(dplyr)

cClasses = c(rep("character",2 ), rep("numeric", 7))
df <- read.csv('household_power_consumption.txt', sep=';', na.strings="?", colClasses=cClasses)
df <- filter(df, Date == "1/2/2007" | Date == "2/2/2007")

df$Date_and_time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

# plot 1

par(mfrow=c(1,1))

hist(df$Global_active_power, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)')
dev.copy(png, file="plot1.png")
dev.off()
