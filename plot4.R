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
feb$Global_reactive_power<-as.character(feb$Global_reactive_power)
feb$Global_reactive_power<-as.numeric(feb$Global_reactive_power)
feb$Voltage<-as.character(feb$Voltage)
feb$Voltage<-as.numeric(feb$Voltage)
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
png(filename="plot4.png",width = 480, height = 480)

## 2x2 plots
par(mfrow=c(2,2))

##First plot
plot(feb$DateTime,feb$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

##Second plot
plot(feb$DateTime,feb$Voltage,type="l",ylab="Voltage", xlab="datetime")

##Plot with multiple lines and legend
plot(feb$DateTime,feb$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(feb$DateTime,feb$Sub_metering_2, type="l", col="red")
lines(feb$DateTime,feb$Sub_metering_3, type="l", col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue") , lty=1, bty='n',cex=0.7)

##Fourth plot
plot(feb$DateTime,feb$Global_reactive_power,type="l",ylab="Global_reactive_power", xlab="datetime")

##Close and save
dev.off()

