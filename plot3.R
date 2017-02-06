##Load file
data<- read.table("household_power_consumption.txt", sep=";", header=T)

##Convert Date
data$Date<-as.character(data$Date)
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

##Subset feb 01, 02
feb<-data[data$Date>=as.Date("2007-02-01")&data$Date<=as.Date("2007-02-02"),]

##Convert measures
feb$Global_active_power<-as.character(feb$Global_active_power)
feb$Global_active_power<-as.numeric(feb$Global_active_power)
feb$Sub_metering_1<-as.character(feb$Sub_metering_1)
feb$Sub_metering_2<-as.character(feb$Sub_metering_2)
feb$Sub_metering_3<-as.character(feb$Sub_metering_3)
feb$Sub_metering_1<-as.numeric(feb$Sub_metering_1)
feb$Sub_metering_2<-as.numeric(feb$Sub_metering_2)
feb$Sub_metering_3<-as.numeric(feb$Sub_metering_3)

##Setup date-time
feb$Time<-as.character(feb$Time)
datetime_s<-paste(feb$Date,feb$Time)
feb$DateTime<-strptime(datetime_s,format="%Y-%m-%d %H:%M:%S")


##Open file
png(filename="plot3.png",width = 480, height = 480)

##Plot with multiple lines and legend
plot(feb$DateTime,feb$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(feb$DateTime,feb$Sub_metering_2, type="l", col="red")
lines(feb$DateTime,feb$Sub_metering_3, type="l", col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue") , lty=1, bty='1',cex=0.7)

##Close and save
dev.off()
