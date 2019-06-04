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
class(power1$Global_active_power)
power1$Global_active_power <- as.numeric(power1$Global_active_power)
hist(power1$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (KW)", ylab = "Frequency", col="red")
dev.copy(png, file="plot1.png")
dev.off()
