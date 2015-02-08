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

## Plot 2
dt <- strptime(paste(ourdata$Date,ourdata$Time),"%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png")
plot(dt,y, xlab ="", type="l", main ="", ylab = "Global Active Power (kilowatts)")
dev.off()