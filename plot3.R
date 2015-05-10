#plot3.R
#Exploratory data analysis - course project 1 - plot 1
#Make a plot of sub metering 1-3 over time between 2007-02-01 and 2007-02-02

# load plotting libraries
library(graphics)
library(grDevices)

# load the data
fileName <- "household_power_consumption.txt"
dat<-read.table(file=fileName,header = TRUE, sep=";")

# convert date and time
datDate <- as.Date(dat$Date, format="%d/%m/%Y")

#convert factor to numeric
sub1 <- as.numeric(levels(dat$Sub_metering_1))[dat$Sub_metering_1]
sub2 <- as.numeric(levels(dat$Sub_metering_2))[dat$Sub_metering_2]
sub3 <- dat$Sub_metering_3

# get rowIds of the two days
idxD1_2 <- datDate=="2007-02-01" | datDate=="2007-02-02"

#get idx of first measurement at 2007-02-02
startD2 <- match(TRUE, datDate[idxD1_2] == "2007-02-02")

#make plot

png(filename="plot3.png",width=480,height=480)
plot(sub1[idxD1_2],type="l",axes=FALSE,xlab="",ylab="Energy sub metering",col="black")
lines(sub2[idxD1_2],type="l",col="red")
lines(sub3[idxD1_2],type="l",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lwd=1)
box(which = "plot", lty="solid",col="grey")
axis(side=1,at=c(1,startD2,length(sub1[idxD1_2])), labels=c("Thu","Fri","Sat"))
axis(side=2,at=c(0,10,20,30))
dev.off()