housepw.consump<-read.table(".//household_power_consumption.txt",
                            header=T,sep=";",
                            na.strings="?",nrows=2075259)
housepw.consump$Date<-strptime(housepw.consump$Date,"%d/%m/%Y")

hpc<-housepw.consump[(housepw.consump$Date=="2007-02-01"|housepw.consump$Date=="2007-02-02"),]
png(filename = "plot2.png",
   width = 480, height = 480, units = "px")

plot(hpc$Global_active_power,
     frame.plot=T,
     axes=F,
     type="l",
     xlab="",
     ylab="Global Active Power(kilowatts)")
axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
axis(side=2,at=c(0,2,4,6),labels=c(0,2,4,6))
dev.off()
