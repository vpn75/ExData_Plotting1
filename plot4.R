#Read in our data file
df <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, 
                 stringsAsFactors = FALSE, na.strings = "?")

#Add Date to Time column for plotting and convert to DateTime class
df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

#Convert Date column to Date class
df$Date <- strptime(df$Date, "%d/%m/%Y")

#Subset data on dates of interest
foo <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02",]

par(mfrow = c(2,2))

#Top-left graph
with(foo, plot(Time, Global_active_power,
               type = "l",
               xlab = "", ylab = "Global Active Power (kilowatts)",
               cex.lab = 0.7, cex.axis = 0.8
))

#Top-right graph
with(foo, plot(Time, Voltage,
               type = "l",
               xlab = "datetime", ylab = "Voltage",
               cex.lab = 0.7, cex.axis = 0.8
))

#Bottom-left graph
plot(foo$Time, foo$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", cex.lab = 0.7, )
lines(foo$Time, foo$Sub_metering_2, col = "red")
lines(foo$Time, foo$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), col = c("black", "red", "blue"), cex = 0.7, bty = "n")

#Bottom-right graph
with(foo, plot(Time, Global_reactive_power,
               type = "l", lwd = 0.5,
               xlab = "datetime", ylab = "Global_reactive_power",
               cex.lab = 0.7, cex.axis = 0.8
))
#Save plot to png file
dev.copy(png, file = "plot4.png", width = 480, height = 480)

#Close device
dev.off()