setwd("C:\\Users\\Bahus\\Desktop\\Coursera\\Exploratory Analysis")

data<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

subdata<-data[as.Date(data$Date,format="%d/%m/%Y")>="2007-02-01"&as.Date(data$Date,format="%d/%m/%Y")<="2007-02-02",] 

png("plot1.png")

hist(as.numeric(subdata$Global_active_power), col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()

