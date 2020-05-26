## Reading the table into R and Subsetting it

pow_con <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";")
pow_con2 <- subset(pow_con, pow_con$Date == "1/2/2007" | pow_con$Date == "2/2/2007")


## Converting the Class of Global Active Power Variable

global_active_pow <- as.numeric(pow_con2$Global_active_power)
global_reactive_pow <- as.numeric(pow_con2$Global_reactive_power)
voltage <- as.numeric(pow_con2$Voltage)


date_time <- strptime(paste(pow_con2$Date, pow_con2$Time, sep = " "),
                      "%d/%m/%Y %H:%M:%S")

sub1 <- as.numeric(pow_con2$Sub_metering_1)
sub2 <- as.numeric(pow_con2$Sub_metering_2)
sub3 <- as.numeric(pow_con2$Sub_metering_3)


## Making the plots and saving them as a png file

png("plot4.png")

par(mfrow = c(2, 2))

# plot 1

plot(date_time, global_active_pow, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# plot 2

plot(date_time, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# plot 3 

plot(date_time, sub1, type = "l", xlab = "", ylab = "Energry sub metering")
lines(date_time, sub2, col = "red")
lines(date_time, sub3, col = "blue")

# plot 4

plot(date_time, global_reactive_pow, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()