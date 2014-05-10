#Get folder of script
folder <- dirname(sys.frame(1)$ofile)
setwd(folder)

#Read all data. 
data <- read.csv(file="./household_power_consumption.txt",sep=";",stringsAsFactors=F,header=T,colClasses=c("character","character",rep("numeric",7)),na.strings="?")

#select Data between 1/2/2007 and 2/2/207
select <- data[as.Date(data$Date,"%j/%m/%Y") %in% c(as.Date("1/2/2007","%j/%m/%Y"),as.Date("2/2/2007","%j/%m/%Y")),]

#Open png graphic device.
png(filename = "./plot4.png", width = 480, height = 480)
par(bg="transparent")
#Change local language to english in order to get english names of days.
Sys.setlocale("LC_TIME", "English")
wDays <- strptime(paste(select$Date, select$Time), format='%d/%m/%Y %H:%M:%S')

#Change global parametre mfrow to draw 4 graphs in one picture.
par(mfrow=c(2,2))

#draw the first plot of Global Active Power (kilowatts).
plot(wDays, select$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Draw the second plot of Voltage.
plot(wDays,select$Voltage, type="l", xlab="datetime", ylab="Voltage")

#Draw the three graphs of"Energy sub metering" in one plot.
plot(wDays,select$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(wDays, select$Sub_metering_2, type="l", xlab="", ylab="Energy sub metering",col="red")
lines(wDays, select$Sub_metering_3, type="l", xlab="", ylab="Energy sub metering",col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,bty="o")

#Draw the forth plot of Global_reactive_power.
plot(wDays, select$Global_reactive_power, type="l", xlab="datetime",ylab="Global_reactive_power")

#close de graphic device
dev.off();