#plot4.R
#Exploratory data analysis - course project 1 - plot 1
#Make a combined plot of 
#1: household global minute-averaged active power
#2: Voltage
#3: sub metering 1-3
#4: household global minute-averaged reactive power
# over time between 2007-02-01 and 2007-02-02

# load plotting libraries
library(graphics)
library(grDevices)

# load the data
fileName <- "household_power_consumption.txt"
dat<-read.table(file=fileName,header = TRUE, sep=";")

# convert date and time
datDate <- as.Date(dat$Date, format="%d/%m/%Y")

#get the data
actPower <- as.numeric(levels(dat$Global_active_power))[dat$Global_active_power]
sub1 <- as.numeric(levels(dat$Sub_metering_1))[dat$Sub_metering_1]
sub2 <- as.numeric(levels(dat$Sub_metering_2))[dat$Sub_metering_2]
sub3 <- dat$Sub_metering_3
volt <- as.numeric(levels(dat$Voltage))[dat$Voltage]
reacPower <- as.numeric(levels(dat$Global_reactive_power))[dat$Global_reactive_power]

# get rowIds of the two days
idxD1_2 <- datDate=="2007-02-01" | datDate=="2007-02-02"

#get idx of first measurement at 2007-02-02
startD2 <- match(TRUE, datDate[idxD1_2] == "2007-02-02")

#make plots

#plot1
png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(actPower[idxD1_2],type="l",axes=FALSE,xlab="",ylab="Global Active Power (kilowatts)")
box(which = "plot", lty="solid",col="grey")
axis(side=1,at=c(1,startD2,length(actPower[idxD1_2])), labels=c("Thu","Fri","Sat"))
axis(side=2,at=c(0,2,4,6))

#plot2
plot(volt[idxD1_2],type="l",axes=FALSE,xlab="datetime",ylab="Voltage")
box(which = "plot", lty="solid",col="grey")
axis(side=1,at=c(1,startD2,length(volt[idxD1_2])), labels=c("Thu","Fri","Sat"))
axis(side=2,at=c(234,236,238,240,242,244,246),labels=c(234,"",238,"",242,"",246))

#plot3
plot(sub1[idxD1_2],type="l",axes=FALSE,xlab="",ylab="Energy sub metering",col="black")
lines(sub2[idxD1_2],type="l",col="red")
lines(sub3[idxD1_2],type="l",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lwd=1,bty="n")
box(which = "plot", lty="solid",col="grey")
axis(side=1,at=c(1,startD2,length(sub1[idxD1_2])), labels=c("Thu","Fri","Sat"))
axis(side=2,at=c(0,10,20,30))

#plot4
plot(reacPower[idxD1_2],type="l",axes=FALSE,xlab="datetime",ylab="Global_reactive_poower")
box(which = "plot", lty="solid",col="grey")
axis(side=1,at=c(1,startD2,length(reacPower[idxD1_2])), labels=c("Thu","Fri","Sat"))
axis(side=2,at=c(0.0,0.1,0.2,0.3,0.4,0.5,0.6))


dev.off()