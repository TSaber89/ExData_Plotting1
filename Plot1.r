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

#Build histogram
hist(my.PowerTable2$Global_active_power,col="red", main = "Global Active Power",xlab="Global Active Power (kilowatts)")

#Print and save
dev.copy(png,file="plot1.png",height=500,width=500)
dev.off()
