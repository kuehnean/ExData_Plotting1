#plot1.R
#Exploratory data analysis - course project 1 - plot 1
#Make a histogram of household global minute-averaged active
#power between 2007-02-01 and 2007-02-02

# load plotting libraries
library(graphics)
library(grDevices)

# load the data
fileName <- "household_power_consumption.txt"
dat<-read.table(file=fileName,header = TRUE, sep=";")

# convert date and time
datDate <- as.Date(dat$Date, format="%d/%m/%Y")

#convert factor to numeric
actPower <- as.numeric(levels(dat$Global_active_power))[dat$Global_active_power]

# get rowIds of the two days
idxD1_2 <- datDate=="2007-02-01" | datDate=="2007-02-02"

#make histogram
png(filename="plot1.png",width=480,height=480)
hist(actPower[idxD1_2], col="red",xlab = "Global Active Power (kilowatts)",ylab = "Frequency", main="Global Active Power", ylim = c(0,1200))
dev.off()