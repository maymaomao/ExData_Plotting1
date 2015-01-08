housepw.consump<-read.table(".//household_power_consumption.txt",
                            header=T,sep=";",
                            na.strings="?",nrows=2075259)
housepw.consump$Date<-strptime(housepw.consump$Date,"%d/%m/%Y")

hpc<-housepw.consump[(housepw.consump$Date=="2007-02-01"|housepw.consump$Date=="2007-02-02"),]
rm("housepw.consump")
png(filename = "plot3.png",
    width = 480, height = 480, units = "px")

plot(hpc$Sub_metering_1,
     frame.plot=T,
     axes=F,
     type="n",
     xlab="",
     ylab="Energy sub metering")
lines(hpc$Sub_metering_1)
lines(hpc$Sub_metering_2,col="red")
lines(hpc$Sub_metering_3,col="blue")

legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"))

axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
axis(side=2,at=c(0,10,20,30),labels=c(0,10,20,30))
dev.off()
