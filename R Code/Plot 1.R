t<- read.table("./Data/household_power_consumption.txt",header = TRUE, sep=";" )

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"))
unlink(temp)

data

t1<-subset(t,t$Date=='2/2/2007' | t$Date==  '1/2/2007')

v1<- as.numeric(paste(t1$Global_active_power))

hist(v1, main = "Global Active Power", xlab= "Global Active Power (kilowatts)", col="Red", ylim=c(0,1300))
