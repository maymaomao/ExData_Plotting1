#read all the data into a data.frame called housepw.consump
housepw.consump<-read.table(".//household_power_consumption.txt",
                            header=T,sep=";",
                            na.strings="?",nrows=2075259)
#convert the Date varialbe into time class
housepw.consump$Date<-strptime(housepw.consump$Date,"%d/%m/%Y")
#subsetting the housepw.consump using 
#Date equal to "2007-02-01" or "2007-02-02
hpc<-housepw.consump[(housepw.consump$Date=="2007-02-01"|housepw.consump$Date=="2007-02-02"),]
#remove the housepw.consump 
rm("housepw.consump")
#create a png called plot1.png with width and height equal to 480 pixels
png(filename = "plot1.png",
    width = 480, height = 480, units = "px")
#plot a histogram,
#arg breaks sets plottting 20 bars 
hist(hpc$Global_active_power,col='red',
     main="Global Active Power",
     breaks=16,
     xlab="Global Active Power (kilowatts)")
#off
dev.off()
