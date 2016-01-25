
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
dev.copy(png, file = "plot2.png")

#Construct time-series plot
plot(x = foo$Time, y = foo$Global_active_power, type="l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

#Close device
dev.off()