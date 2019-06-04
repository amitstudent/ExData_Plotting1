library(lubridate)
power <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
power$Date <- dmy(power$Date) # Formating the date
head(power$Date) # checking if the date format has changed or not
class(power$Time)
power$Time <- hms(power$Time)  # Formating the time
head(power$Time) # checking if the time format has changed or not
power1 <- subset(power, Date >= "2007-02-01" & Date <= "2007-02-02") # Subsetting to what we need
head(power1)
rm(power) # Removing the original dataframe

# Plotting the graph
class(power1$Sub_metering_1)
class(power1$Sub_metering_2)
class(power1$Sub_metering_3)
power1$day <- wday(power1$Date, label = TRUE)
head(power1)
power1$Sub_metering_1 <- as.numeric(power1$Sub_metering_1)
power1$Sub_metering_2 <- as.numeric(power1$Sub_metering_2)
par(mar=c(2,4,1,2)) # Setting the graph margin
plot(power1$Sub_metering_1, type="l", col="black", xaxt = "n", xlab = "", ylab = "Energy sub metering", ylim=c(0,40))
lines(power1$Sub_metering_2, type="l", col="red")
lines(power1$Sub_metering_3, type="l", col="blue")
axis(side = 1, at = c(0, 1400, 2800), labels = c("Thu", "Fri", "Sat"))
legend("topright", col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)
dev.copy(png, file="plot3.png")
dev.off()
