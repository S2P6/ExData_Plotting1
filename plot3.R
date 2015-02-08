setwd(paste(getwd(),"/RCourse", sep = ""))
##reading all the lines
fn <- "household_power_consumption.txt"
Alldata <- read.csv2(fn, sep=";",na.strings="?", dec=".")
datemin <- strptime("01/02/2007","%d/%m/%Y")
##cutting with two dates
datemax <- strptime("02/02/2007","%d/%m/%Y")
ourdata <- Alldata[strptime(Alldata$Date,"%d/%m/%Y")<= datemax,]
ourdata <- ourdata[strptime(ourdata$Date,"%d/%m/%Y")>= datemin,]

y<-ourdata$Global_active_power


dt <- strptime(paste(ourdata$Date,ourdata$Time),"%d/%m/%Y %H:%M:%S")

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