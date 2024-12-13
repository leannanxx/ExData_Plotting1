#Exploratory Data Analysis, Course Project 1

power_data <- read.table("C:/Users/winz_ju/Desktop/R_Coursera/householdpower/household_power_consumption.txt", 
                         header = TRUE, sep = ";", dec = ".")

#Subset relevant date
subpower_data <- subset(power_data,power_data$Date=="1/2/2007" | power_data$Date =="2/2/2007")

#Get data type
class(subpower_data$Global_active_power)

#Turn data to numeric data
global_a_pow <- as.numeric(subpower_data$Global_active_power)

#define margin
par(mar = c(4,4,4,3))

#create histogram
hist(global_a_pow, 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", 
     col = "red",
     xaxt = "n", 
     yaxt = "n"  #blend axes
)

#redefine axes
axis(1, at = seq(from = 0, to = 6, by = 2)) 
axis(2, at = seq(from = 0, to = 1200, by = 200))


#copy to .png
png("plot1.png", width = 480, height = 480, unit = "px")
dev.off()
power_data <- read.table("household_power_consumption.txt", 
                         header = TRUE, sep = ";", dec = ".")

subpower_data <- subset(power_data,power_data$Date=="1/2/2007" | power_data$Date =="2/2/2007")

#Get data type
class(subpower_data$Global_active_power)

#Turn data into numeric data
global_a_pow <- as.numeric(subpower_data$Global_active_power)

#define margin
par(mar = c(4,4,4,3))

#create histogram
hist(global_a_pow, 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", 
     col = "red",
     xaxt = "n", 
     yaxt = "n"  #blend axes
)

#redefine axes
axis(1, at = seq(from = 0, to = 6, by = 2)) 
axis(2, at = seq(from = 0, to = 1200, by = 200))


#copy to .png
dev.copy(png, filename="plot1.png", width = 480, height = 480, unit = "px")
dev.off()


