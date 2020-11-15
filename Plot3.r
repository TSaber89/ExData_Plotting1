
#Load table
my.PowerTable <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors = FALSE)

#Convert Date field from character to date
my.PowerTable$Date <- as.Date(my.PowerTable$Date,format='%d/%m/%Y')

#Subset the working table to include specific dates
my.PowerTable2<-subset(my.PowerTable,subset=(Date>="2007-01-01" & Date<="2007-02-01"))

#Combine the Date and Time columns into a new column
my.PowerTable2$combo<-paste(my.PowerTable2$Date,my.PowerTable2$Time,sep=" ")

#Convert the combined Date and Time field into a POSIXlt
my.PowerTable2$combo2 <- strptime(my.PowerTable2$combo,format = "%Y-%m-%d %H:%M:%S")

#Build plot
plot(my.PowerTable2$combo2,my.PowerTable2$Global_active_power,type='l',xlab=" ",ylab = "Global Active Power (kilowatts)")
lines(my.PowerTable2$combo2,my.PowerTable2$Sub_metering_2,type="l",col="red")
lines(my.PowerTable2$combo2,my.PowerTable2$Sub_metering_3,type="l",col="blue")
legend("topright",col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2.5)

#Print and save
dev.copy(png,file="plot3.png",height=700,width=800)
dev.off()












