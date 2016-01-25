#Read in our data file
df <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, 
                 stringsAsFactors = FALSE, na.strings = "?")

#Add Date to Time column for plotting and convert to DateTime class
df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

#Convert Date column to Date class
df$Date <- strptime(df$Date, "%d/%m/%Y")

#Subset data on dates of interest
foo <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02",]

#Save plot to png file
dev.copy(png, file = "plot3.png")

#Make our plots
plot(foo$Time, foo$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(foo$Time, foo$Sub_metering_2, col = "red")
lines(foo$Time, foo$Sub_metering_3, col = "blue")

#Add legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black","red", "blue"))

#Close device
dev.off()