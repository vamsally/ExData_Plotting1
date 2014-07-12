## Plot 4

# set working directory
setwd("/Users/sallylee/datasciencecoursera/ExData_Plotting1")

# read data into table
d1 <- read.table ("household_power_consumption.txt", header = TRUE, sep=";")

# take a look at the data
# head (d1)
# convert date column to a date
d1$Datef <- as.Date(d1$Date, format = "%d/%m/%Y")

#subset date range wanted
d1sub <- subset (d1, Datef >="2007-02-01" & Datef<="2007-02-02")

#create date time column for plot
d1sub$Datetime <- strptime(paste(d1sub$Date,d1sub$Time), format ="%d/%m/%Y %H:%M:%S")

library (datasets)

# to create png file
png(file = "plot4.png", width=480, height = 480)

par (mfrow = c(2,2))

#create first plot
plot (d1sub$Datetime, as.numeric(as.character(d1sub$Global_active_power))
      , type="l", ylab="Global Active Power", xlab="")

#create 2nd plot
plot (d1sub$Datetime, as.numeric(as.character(d1sub$Voltage))
      , type="l", ylab="Voltage", xlab="datetime")

#create 3rd plot
plot (d1sub$Datetime, as.numeric(as.character(d1sub$Sub_metering_1))
      , type="l", xlab="", ylab="Energy sub metering")
lines (d1sub$Datetime, as.numeric(as.character(d1sub$Sub_metering_2))
       ,type = "l", col = "red")
lines (d1sub$Datetime, as.numeric(as.character(d1sub$Sub_metering_3))
       ,type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue")
       , lty ="solid", inset = 0, bty="n"
       , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

#create 4th plot
plot (d1sub$Datetime, as.numeric(as.character(d1sub$Global_reactive_power))
      , type="l", ylab="Global_reactive_power", xlab="datetime")

# turn off png device
dev.off() 
