#Get folder of script
folder <- dirname(sys.frame(1)$ofile)
setwd(folder)

#Read all data. 
data <- read.csv(file="./household_power_consumption.txt",sep=";",stringsAsFactors=F,header=T,colClasses=c("character","character",rep("numeric",7)),na.strings="?")

#select Data between 1/2/2007 and 2/2/207
select <- data[as.Date(data$Date,"%j/%m/%Y") %in% c(as.Date("1/2/2007","%j/%m/%Y"),as.Date("2/2/2007","%j/%m/%Y")),]

#Open png graphic device.
png(filename = "./plot3.png", width = 480, height = 480)
par(bg="transparent")
#Change local language to english in order to get english names of days.
Sys.setlocale("LC_TIME", "English")
wDays <- strptime(paste(select$Date, select$Time), format='%d/%m/%Y %H:%M:%S')

#Plot th first graphe select$Sub_metering_1. 
plot(wDays, as.numeric(select$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering")
#Add the second graphe select$Sub_metering_1 (red).
lines(wDays, as.numeric(select$Sub_metering_2), type="l", xlab="", ylab="Energy sub metering",col="red")
#Add the third graphe select$Sub_metering_1 (blue).
lines(wDays, as.numeric(select$Sub_metering_3), type="l", xlab="", ylab="Energy sub metering",col="blue")
#Add legend of three graphs.
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,bty="o")


#close graphic device.
dev.off()