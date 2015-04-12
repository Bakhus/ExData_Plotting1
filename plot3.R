setwd("C:\\Users\\Bahus\\Desktop\\Coursera\\Exploratory Analysis")

data<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

subdata<-data[as.Date(data$Date,format="%d/%m/%Y")>="2007-02-01"&as.Date(data$Date,format="%d/%m/%Y")<="2007-02-02",] 

png("plot3.png")

date<-as.Date(subdata[,1],format="%d/%m/%Y")
time<-subdata[,2];

d_t<-paste(date,time);
d_t<-strptime(d_t,"%Y-%m-%d %H:%M")

sm1<-subdata[,7]
sm2<-subdata[,8]
sm3<-subdata[,9]

plot(d_t,sm1, type="l", ylab="Energy sub metering", xlab="")
lines(d_t,sm2,type="l",col="Red")
lines(d_t,sm3,type="l",col="Blue")
legend("topright", lty=1, col = c("black","blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off()