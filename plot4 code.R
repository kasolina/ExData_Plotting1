library(readr)
data <- read_delim(file_path, delim = ";")
# Convert the Date column to Date type
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
# Filter the data for the specific dates
filtered_data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
head(filtered_data)



# Set up the PNG device with specified width and height
png(filename = "plot4.png", width = 480, height = 480)

plot(filtered_data$DateTime,as.numeric(filtered_data$Voltage), type = "l", col = "black",
     main = "Voltage Over Time",
     ylab = "Voltage",xlab = "Date")

# Customize the x-axis with formatted date labels
# Close the PNG device
dev.off()


# Set up the PNG device with specified width and height
png(filename = "plot5.png", width = 480, height = 480)

plot(filtered_data$DateTime,as.numeric(filtered_data$Global_reactive_power), type = "l", col = "black",
     main = "Global Reactive Power (kilowatts)",
     ylab = "Global reactive power",xlab = "Date")

# Customize the x-axis with formatted date labels
# Close the PNG device
dev.off()



# Set up the PNG device with specified width and height
png(filename = "plot6.png", width = 480, height = 480)
par(mfrow=c(2,2),pty="s")
plot(filtered_data$DateTime, filtered_data$Global_active_power, type = "l", col = "black",
     main = "Global Active Power Over Time",
     ylab = "Global Active Power (kilowatts)",xlab = "Date")

plot(filtered_data$DateTime,as.numeric(filtered_data$Voltage), type = "l", col = "black",
     main = "Voltage Over Time",
     ylab = "Voltage",xlab = "Date")

plot(filtered_data$DateTime, filtered_data$Sub_metering_1, type = "l", col = "black",ylab = "Energy sub metering",xlab = "Date")

lines(filtered_data$DateTime, filtered_data$Sub_metering_2, type = "l", col = "red")

lines(filtered_data$DateTime, filtered_data$Sub_metering_3, type = "l", col = "blue")

# Add a legend
legend("topright", legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"), col = c("black", "red", "blue"), lty = 1)

plot(filtered_data$DateTime,as.numeric(filtered_data$Global_reactive_power), type = "l", col = "black",
     main = "Global Reactive Power (kilowatts)",
     ylab = "Global reactive power",xlab = "Date")
dev.off()


