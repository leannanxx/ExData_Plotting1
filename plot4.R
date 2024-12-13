# Reading power data
power_data <- read.table("householdpower/household_power_consumption.txt", 
                         header = TRUE, sep = ";", dec = ".")

#Subset relevant date
subpower_data <- subset(power_data,power_data$Date=="1/2/2007" | power_data$Date =="2/2/2007")

#Get data type
class(subpower_data$Global_active_power)

#Turn data to numeric data
global_a_pow <- as.numeric(subpower_data$Global_active_power)


## Transforming the Date and Time variables 
subpower_data$Date <- as.Date(subpower_data$Date, format="%d/%m/%Y")
subpower_data$Time <- strptime(subpower_data$Time, format="%H:%M:%S")
subpower_data[1:1440,"Time"] <- format(subpower_data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower_data[1441:2880,"Time"] <- format(subpower_data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


##Plotting the data
  par(mfrow = c(2,2))

##plot 1.1

  plot(subpower_data$Time, global_a_pow,
     xlab = "",
     ylab = "Global Active Power", 
     type = "l",
     xaxt = "n")

  #redefine axis
  breaks <- c(min(subpower_data$Time), mean(subpower_data$Time), max(subpower_data$Time))
  label <- c("Thu", "Fri", "Sat")

  axis(1, at = as.numeric(breaks), labels = label)


##plot 1.2
  
  plot(subpower_data$Time, subpower_data$Voltage, type="l",
       xlab = "datetime",
       ylab = "Voltage", 
       xaxt = "n")
  
  #redefine axis
  breaks <- c(min(subpower_data$Time), mean(subpower_data$Time), max(subpower_data$Time))
  label <- c("Thu", "Fri", "Sat")
  
  axis(1, at = as.numeric(breaks), labels = label)

  

##plot 2.1

  plot(subpower_data$Time, subpower_data$Sub_metering_1, type="n",
       xlab = "",
       ylab = "Energy sub metering", 
       xaxt = "n")
  
  lines(subpower_data$Time, subpower_data$Sub_metering_1, col = "black")
  lines(subpower_data$Time, subpower_data$Sub_metering_2, col = "red")
  lines(subpower_data$Time, subpower_data$Sub_metering_3, col = "blue")
  
  
  #include legend
  legend("topright", lty = 1, bty = "n", col = c("black","red","blue"), 
         cex = 0.65,
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  
  #redefine axis
  breaks <- c(min(subpower_data$Time), mean(subpower_data$Time), max(subpower_data$Time))
  label <- c("Thu", "Fri", "Sat")
  
  axis(1, at = as.numeric(breaks), labels = label)


##plot 2.2

  plot(subpower_data$Time, subpower_data$Global_reactive_power, type="l",
       xlab = "datetime",
       ylab = "Global_reactive_power", 
       xaxt = "n")
  
  #redefine axis
  breaks <- c(min(subpower_data$Time), mean(subpower_data$Time), max(subpower_data$Time))
  label <- c("Thu", "Fri", "Sat")
  
  axis(1, at = as.numeric(breaks), labels = label)

  
##copy to .png
  dev.copy(png, filename="plot4.png", width = 480, height = 480, unit = "px")
  dev.off()