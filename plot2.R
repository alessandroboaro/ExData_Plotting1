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

##Setup date-time
feb$Time<-as.character(feb$Time)
datetime_s<-paste(feb$Date,feb$Time)
feb$DateTime<-strptime(datetime_s,format="%Y-%m-%d %H:%M:%S")


##Open file
png(filename="plot2.png",width = 480, height = 480)

##Plot graph
plot(feb$DateTime,feb$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

##Close and save
dev.off()

