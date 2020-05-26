## Reading the table into R and Subsetting it

pow_con <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";")
pow_con2 <- subset(pow_con, pow_con$Date == "1/2/2007" | pow_con$Date == "2/2/2007")


## Making necessary changes to plot the graph

date_time <- strptime(paste(pow_con2$Date, pow_con2$Time, sep = " "),
                      "%d/%m/%Y %H:%M:%S")

sub1 <- as.numeric(pow_con2$Sub_metering_1)
sub2 <- as.numeric(pow_con2$Sub_metering_2)
sub3 <- as.numeric(pow_con2$Sub_metering_3)


## Plotting the graph and saving it as a png file

png("plot3.png")

plot(date_time, sub1, type = "l", xlab = "", ylab = "Energry sub metering")
lines(date_time, sub2, col = "red")
lines(date_time, sub3, col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"))

dev.off()