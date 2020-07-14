#CARGAR BASE DE DATOS Y CONFIGURAR SUBCONJUNTOS
Data=read.csv("household_power_consumption.txt", sep=";", header=T)
Data$Date<-as.Date(Data$Date,format='%d/%m/%Y')
head(Data$Date)
Datos1<-subset(Data,Date%in%as.Date(c("2007-02-01","2007-02-02")))
Datos1$DateTime=as.POSIXct(paste(Datos1$Date,Datos1$Time))
Datos1$Global_active_power<-as.numeric(Datos1$Global_active_power)
DateTime<-Datos1$DateTime

#PLOT1
png("plot1.png", width=480, height=480)
hist(Datos1$Global_active_power,xlab="Global Active Power(kilowatts)",ylab="Frequency",main="Global Active Power",col="red")
dev.off()

#PLOT2
png("plot2.png", width=480, height=480)
plot(x=DateTime,y=Datos1$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()

#PLOT3
png("plot3.png", width=480, height=480)
plot(x=DateTime,y=Datos1$Sub_metering_1,xlab="",type="l",ylab="Energy sub metering")
lines(x=DateTime,y=Datos1$Sub_metering_2,col="red")
lines(x=DateTime,y=Datos1$Sub_metering_3,col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

#PLOT4
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(x=DateTime,y=Datos1$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
plot(x=DateTime,y=Datos1$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(x=DateTime,y=Datos1$Sub_metering_1,xlab="",type="l",ylab="Energy sub metering")
lines(x=DateTime,y=Datos1$Sub_metering_2,col="red")
lines(x=DateTime,y=Datos1$Sub_metering_3,col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(x=DateTime,y=Datos1$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()