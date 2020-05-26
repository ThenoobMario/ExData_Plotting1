## Reading the table into R and Subsetting it

pow_con <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";")
pow_con2 <- subset(pow_con, pow_con$Date == "1/2/2007" | pow_con$Date == "2/2/2007")


## Making necessary changes to plot the graph

global_active_pow <- as.numeric(pow_con2$Global_active_power)

date_time <- strptime(paste(pow_con2$Date, pow_con2$Time, sep = " "),
                      "%d/%m/%Y %H:%M:%S")


## Plotting the graph and saving it as a png file

png("plot2.png")
plot(date_time, global_active_pow, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()