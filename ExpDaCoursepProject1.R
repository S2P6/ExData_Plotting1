setwd(paste(getwd(),"/RCourse", sep = ""))
##reading all the lines
fn <- "household_power_consumption.txt"
Alldata <- read.csv2(fn, sep=";",na.strings="?", dec=".")
datemin <- strptime("01/02/2007","%d/%m/%Y")
##cutting with two dates
datemax <- strptime("02/02/2007","%d/%m/%Y")
ourdata <- Alldata[strptime(Alldata$Date,"%d/%m/%Y")<= datemax,]
ourdata <- ourdata[strptime(ourdata$Date,"%d/%m/%Y")>= datemin,]
## Plot 1
y<-ourdata$Global_active_power
png(filename = "plot1.png")
hist(y, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
## Plot 2
dt <- strptime(paste(ourdata$Date,ourdata$Time),"%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png")
plot(dt,y, xlab ="", type="l", main ="", ylab = "Global Active Power (kilowatts)")
dev.off()
## Plot 3
sm1<-ourdata$Sub_metering_1
sm2<-ourdata$Sub_metering_2
sm3<-ourdata$Sub_metering_3
png(filename = "plot3.png")
plot(dt,sm1, xlab ="", type="l", main ="", ylab = "Energy sub metering")
lines(dt,sm2, type="l", col = "red")
lines(dt,sm3, type="l", col = "blue")
textlegend <-c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")
legend("topright", lty = 1, col = c("blacK","red","blue"), legend = textlegend)
dev.off()

## Plot 4
png(filename = "plot4.png")
par(mfrow = c(2,2))
##Plot 1/4
plot(dt,y, xlab ="", type="l", main ="", ylab = "Global Active Power (kilowatts)")
##Plot 2/4
plot(dt,ourdata$Voltage, xlab ="datetime", type="l", main ="", ylab = "Voltage")
## Plot 3/4
plot(dt,sm1, xlab ="", type="l", main ="", ylab = "Energy sub metering")
lines(dt,sm2, type="l", col = "red")
lines(dt,sm3, type="l", col = "blue")
textlegend <-c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")
legend("topright", lty = 1, col = c("blacK","red","blue"), legend = textlegend)

## Plot 4/4
plot(dt,ourdata$Global_reactive_power, xlab ="datetime", type="l", main ="", ylab="Global_reactive_power")

dev.off()