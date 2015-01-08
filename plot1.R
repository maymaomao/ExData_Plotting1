housepw.consump<-read.table(".//household_power_consumption.txt",
                            header=T,sep=";",
                            na.strings="?",nrows=2075259)
housepw.consump$Date<-strptime(housepw.consump$Date,"%d/%m/%Y")

hpc<-housepw.consump[(housepw.consump$Date=="2007-02-01"|housepw.consump$Date=="2007-02-02"),]
png(filename = "plot1.png",
    width = 480, height = 480, units = "px")
hist(hpc$Global_active_power,col='red',
     main="Global Active Power",
     breaks=20,
     xlab="Global Active Power(kilowatts)")
dev.off()
