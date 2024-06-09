library(readr)
data <- read_delim(file_path, delim = ";")
# Convert the Date column to Date type
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
# Filter the data for the specific dates
filtered_data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
head(filtered_data)

# Set up the PNG device with specified width and height
png(filename = "plot1.png", width = 480, height = 480)

filtered_data$gap <- as.numeric(filtered_data$Global_active_power)

hist(gap, col ="red", main = "Gloval Active Power",
     xlab = "Gloval Active Power(Kilowatts)")

# Close the PNG device
dev.off()
