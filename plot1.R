## Reading the table into R and Subsetting it

pow_con <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";")
pow_con2 <- subset(pow_con, pow_con$Date == "1/2/2007" | pow_con$Date == "2/2/2007")


## Converting the Class of Global Active Power Variable

pow_con2$Global_active_power <- as.numeric(pow_con2$Global_active_power)


## Creating the histogram and saving it as png file

with(pow_con2, hist(Global_active_power, main = "Global Active Power", col = "red", 
                  xlab = "Global Active Power (kilowatts)"))

dev.copy(png, file = "plot1.png")
dev.off()