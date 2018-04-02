
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
t <- read.table(unz(temp, "household_power_consumption.txt"),,header = TRUE, sep=";")
unlink(temp)



t1<-subset(t,t$Date=='2/2/2007' | t$Date==  '1/2/2007')

d<-paste(t1$Date, t1$Time)

datetimes<- as.POSIXct(as.character(d),format="%d/%m/%Y %H:%M:%S")
par(mfrow=c(2,2))

var1<-as.numeric(paste(t1$Global_reactive_power))
var2<- as.numeric(paste(t1$Voltage))
plot(var1,x=datetimes, type="l", ylab="global_reactive_power", xlab="datetime")
plot(var2,x=datetimes, type="l", ylab="voltage", xlab="datetime")

png(filename="Plot4.png", width=480, height=480)


par(mfrow=(c(2,2)))

plot(y=v1, x=datetimes, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(var2,x=datetimes, type="l", ylab="Voltage", xlab="datetime")
plot(t1$Sub_metering_1,x=datetimes, type="l", ylab="Energy sub metering",yaxt="n", xlab="", ylim=c(0,35))
lines(x=datetimes, y=t1$Sub_metering_2, type="l", col="red")
lines(x=datetimes, y=t1$Sub_metering_3, type="l", col="blue")
axis(side=2,at=c(0,10,20,30))
legend('topright',legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,cex=.6)

plot(var1,x=datetimes, type="l", ylab="global_reactive_power", xlab="datetime")

dev.off()