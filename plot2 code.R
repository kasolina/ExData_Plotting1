library(readr)
data <- read_delim(file_path, delim = ";")
# Convert the Date column to Date type
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
# Filter the data for the specific dates
filtered_data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
head(filtered_data)

# Set up the PNG device with specified width and height
png(filename = "plot2.png", width = 480, height = 480)


plot(filtered_data$DateTime, filtered_data$Global_active_power, type = "l", col = "black",
     main = "Global Active Power Over Time",
     ylab = "Global Active Power (kilowatts)",xlab = "Date")

# Customize the x-axis with formatted date labels

# Close the PNG device
dev.off()