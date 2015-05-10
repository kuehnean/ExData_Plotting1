#plot2.R
#Exploratory data analysis - course project 1 - plot 1
#Make a plot of global minute-averaged active
#power over time between 2007-02-01 and 2007-02-02

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

#get idx of first measurement at 2007-02-02
startD2 <- match(TRUE, datDate[idxD1_2] == "2007-02-02")

#make plot

png(filename="plot2.png",width=480,height=480)
plot(actPower[idxD1_2],type="l",axes=FALSE,xlab="",ylab="Global Active Power (kilowatts)")
box(which = "plot", lty="solid",col="grey")
axis(side=1,at=c(1,startD2,length(actPower[idxD1_2])), labels=c("Thu","Fri","Sat"))
axis(side=2,at=c(0,2,4,6))
dev.off()