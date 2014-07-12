## Plot 1 Global Active Power
## Frequency vs. Global Active Power (kilowatts)

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

library (datasets)

# to create png file
png(file = "plot1.png", width=480, height = 480)

#create histogram
hist (as.numeric(as.character(d1sub$Global_active_power)), col="red"
      , main="Global Active Power", xlab="Global Active Power (kilowatts)")

# turn off png device
dev.off() 
