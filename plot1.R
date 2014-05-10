
#Get folder of script.
folder <- dirname(sys.frame(1)$ofile)
setwd(folder)

#Read all data. 
data <- read.csv(file="./household_power_consumption.txt",sep=";",stringsAsFactors=F,header=T,colClasses=c("character","character",rep("numeric",7)),na.strings="?")

#select Data between 1/2/2007 and 2/2/207.
select <- data[as.Date(data$Date,"%j/%m/%Y") %in% c(as.Date("1/2/2007","%j/%m/%Y"),as.Date("2/2/2007","%j/%m/%Y")),]

#Open png graphic device.
png(filename = "./plot1.png", width = 480, height = 480)

#Draw the histogram.
par(bg="transparent")
hist(as.numeric(select$Global_active_power),xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")

#close graphic device.
dev.off()