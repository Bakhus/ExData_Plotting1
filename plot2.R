setwd("C:\\Users\\Bahus\\Desktop\\Coursera\\Exploratory Analysis")

data<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

subdata<-data[as.Date(data$Date,format="%d/%m/%Y")>="2007-02-01"&as.Date(data$Date,format="%d/%m/%Y")<="2007-02-02",] 

png("plot2.png")

date<-as.Date(subdata[,1],format="%d/%m/%Y")
time<-subdata[,2];

d_t<-paste(date,time);
d_t<-strptime(d_t,"%Y-%m-%d %H:%M")

gp<-subdata[,3]

plot(d_t,gp, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()



