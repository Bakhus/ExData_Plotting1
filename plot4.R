setwd("C:\\Users\\Bahus\\Desktop\\Coursera\\Exploratory Analysis")

data<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

subdata<-data[as.Date(data$Date,format="%d/%m/%Y")>="2007-02-01"&as.Date(data$Date,format="%d/%m/%Y")<="2007-02-02",] 

date<-as.Date(subdata[,1],format="%d/%m/%Y")
time<-subdata[,2];

d_t<-paste(date,time);
d_t<-strptime(d_t,"%Y-%m-%d %H:%M")


png("plot4.png")

par(mfrow=c(2,2))

######### plot 1 ###########################
gp<-subdata[,3]

plot(d_t,gp, type="l", ylab="Global Active Power", xlab="")

######### plot 2 ###########################
vlt<-subdata[,5]

plot(d_t,vlt, type="l", ylab="Voltage", xlab="datetime")

######### plot 3 ###########################
sm1<-subdata[,7]
sm2<-subdata[,8]
sm3<-subdata[,9]

plot(d_t,sm1, type="l", ylab="Energy sub metering", xlab="")
lines(d_t,sm2,type="l",col="Red")
lines(d_t,sm3,type="l",col="Blue")
legend("topright", lty=1, col = c("black","blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

######### plot 4 ###########################
rp<-subdata[,4]

plot(d_t,rp, type="l", ylab="Global_reactive_power", xlab="datetime")

############################################

dev.off()