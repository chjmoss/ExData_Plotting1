
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
t <- read.table(unz(temp, "household_power_consumption.txt"),,header = TRUE, sep=";")
unlink(temp)



t1<-subset(t,t$Date=='2/2/2007' | t$Date==  '1/2/2007')

d<-paste(t1$Date, t1$Time)

datetimes<- as.POSIXct(as.character(d),format="%d/%m/%Y %H:%M:%S")

png(filename="Plot2.png", width=480, height=480)
par(mfrow=c(1,1))


plot(y=v1, x=datetimes, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()