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


##Open file
png(filename="plot1.png",width = 480, height = 480)

##Plot histogram
hist(feb$Global_active_power,main="Global Active Power", 
     xlab="Global active power (kilowatts)", 
     col="red",
     ylim=c(0,1300),
     xlim=c(0,6),
     breaks=seq(0,8,0.5)
     )


##Close and save
dev.off()





