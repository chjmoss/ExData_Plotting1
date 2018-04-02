
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
t <- read.table(unz(temp, "household_power_consumption.txt"),,header = TRUE, sep=";")
unlink(temp)



t1<-subset(t,t$Date=='2/2/2007' | t$Date==  '1/2/2007')



v1<- as.numeric(paste(t1$Global_active_power))


png(filename="Plot1.png", width=480, height=480)

par(mfrow=c(1,1))

hist(v1, main = "Global Active Power", xlab= "Global Active Power (kilowatts)", col="Red", ylim=c(0,1300))

dev.off()