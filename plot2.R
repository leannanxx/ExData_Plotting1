# Reading, naming and subsetting power consumption data
power_data <- read.table("householdpower/household_power_consumption.txt", 
                    header = TRUE, sep = ";", dec = ".")

#Subset relevant date
subpower_data <- subset(power_data,power_data$Date=="1/2/2007" | power_data$Date =="2/2/2007")

#Get data type
class(subpower_data$Global_active_power)

#Turn data to numeric data
global_a_pow <- as.numeric(subpower_data$Global_active_power)


# Transforming the Date and Time variables 
subpower_data$Date <- as.Date(subpower_data$Date, format="%d/%m/%Y")
subpower_data$Time <- strptime(subpower_data$Time, format="%H:%M:%S")
subpower_data[1:1440,"Time"] <- format(subpower_data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower_data[1441:2880,"Time"] <- format(subpower_data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


#Plotting the data
plot(subpower_data$Time, global_a_pow,
     xlab = "",
     ylab = "Global Active Power (kilowatts)", 
     type = "l",
     xaxt = "n")

#redefine axis
breaks <- c(min(subpower_data$Time), mean(subpower_data$Time), max(subpower_data$Time))
label <- c("Thu", "Fri", "Sat")

axis(1, at = as.numeric(breaks), labels = label)


#copy to .png
dev.copy(png, filename="plot2.png", width = 480, height = 480, unit = "px")
dev.off()
