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
#create a png called plot2.png with width and height equal to 480 pixels
png(filename = "plot2.png",
   width = 480, height = 480, units = "px")
#plotting 
#have frame and no axes,plotting line
plot(hpc$Global_active_power,
     frame.plot=T,
     axes=F,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
#axis sets the x and y axis attributes
axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
axis(side=2,at=c(0,2,4,6),labels=c(0,2,4,6))
#off the plotting action
dev.off()
