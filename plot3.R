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
#create a png called plot3.png with width and height equal to 480 pixels
png(filename = "plot3.png",
    width = 480, height = 480, units = "px")
#plotting
#frame.plot =T means using the frame
#type="n" is very important ,which means I will plot multiple lines
plot(hpc$Sub_metering_1,
     frame.plot=T,
     axes=F,
     type="n",
     xlab="",
     ylab="Energy sub metering")
lines(hpc$Sub_metering_1)
lines(hpc$Sub_metering_2,col="red")
lines(hpc$Sub_metering_3,col="blue")
#creating the legend
#x sets the legend loacation is "topright"
#legend sets the names
#lty sets the the lines before each names
#col sets the color of the line
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"))
#set the axis x and y
axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
axis(side=2,at=c(0,10,20,30),labels=c(0,10,20,30))
#off 
dev.off()
