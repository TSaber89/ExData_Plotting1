
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

##Build the plots
png(file="plot4.png")
par(mfcol=c(2,2),mar=c(4,4,2,2))

#PLOT 1
plot(my.PowerTable2$combo2,my.PowerTable2$Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab ="")

#PLOT 2
plot(my.PowerTable2$combo2,my.PowerTable2$Sub_metering_1, col="red",
     ylab="Energy Sub metering",type="l", xlab="")
lines(my.PowerTable2$combo2,my.PowerTable2$Sub_metering_2,col="green")
lines(my.PowerTable2$combo2, my.PowerTable2$Sub_metering_3,col="blue")
legend("topright",c("sub_metering_1",
                    "sub_metering_2","sub_metering_3"),col=c("red","green","blue"),lwd=1)

# PLOT 3
plot(my.PowerTable2$combo2,my.PowerTable2$Voltage,ylab="Voltage",xlab="DateTime",type="l")

# PLOT 4
plot(my.PowerTable2$combo2,my.PowerTable2$Global_reactive_power,ylim=c(0.0,0.5),ylab="Global Reactive Power",xlab="DateTime",type="l")

#Close the file
dev.off()




