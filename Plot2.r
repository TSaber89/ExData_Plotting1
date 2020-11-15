
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

#Print and save
dev.copy(png,file="plot2.png",height=500,width=500)
dev.off()












______________________

my.PowerTable <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

my.PowerTable <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="NA")

my.PowerTable$Date <- as.Date(my.PowerTable$Date,format='%d/%m/%Y')


my.PowerTable2 <- my.PowerTable[my.PowerTable$Date >= "2007-02-01" & my.PowerTable$Date <= "2007-02-02",]
my.PowerTable2 <- my.PowerTable[my.PowerTable$Date >= "2007-01-02" & my.PowerTable$Date <= "2007-02-02",]

my.PowerTable2$Global_active_power <- as.numeric(my.PowerTable2$Global_active_power)

hist(my.PowerTable2$Global_active_power,col="red",breaks=12,ylim=c(0,1200), 
     main = "Global Active Power",xlab="Global Active Power (kilowatts)")

> my.daydata$weekday<-weekdays(my.daydata$Date)
> View(my.daydata)




##myData[myData$myDate >= "1970-01-01" & myData$myDate <= "2016-06-27",]-12

##> my.PowerTable2 <- my.PowerTable[my.PowerTable$Date > "2006-12-15" & my.PowerTable$Date < "2006-12-17",]

##my.PowerTable2$Global_active_power <- as.numeric(my.PowerTable2$Global_active_power)
## hist(my.PowerTable2$Global_active_power,col="red")

## hist(my.PowerTable2$Global_active_power,col="red",breaks=12,ylim=c(0,1200), 
main = "Global Active Power",xlab="Global Active Power (kilowatts")