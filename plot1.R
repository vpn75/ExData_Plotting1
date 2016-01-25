#Read in our data file
df <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, 
                 stringsAsFactors = FALSE, na.strings = "?")

#Convert Date column to Date class
df$Date <- strptime(df$Date, "%d/%m/%Y")

#Subset data on dates of interest
foo <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02",]

#Save plot to png file
dev.copy(png, file = "plot1.png")

#Create histogram plot
hist(foo$Global_active_power, xlab = "Global Active Power (kilowatts)",
     col = "red", main = "Global Active Power")

#Close device
dev.off()