## Plot 2 
## Global Active Power (kilowatts) vs. Days

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
png(file = "plot2.png", width=480, height = 480)

#create plot
plot (d1sub$Datetime, as.numeric(as.character(d1sub$Global_active_power))
      , type="l", ylab="Global Active Power (kilowatts)", xlab="")

# turn off png device
dev.off() 
