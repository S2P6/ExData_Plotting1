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