zip_file<-file.choose()
output_directory<-'C:/Jonathan'
unzip(zip_file,exdir=output_directory)
setwd(output_directory)

data<-read.table('household_power_consumption.txt',sep=';',header=TRUE,quote="",na.strings = "?")
sub_data<-data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
sub_data$Date<-as.Date(sub_data$Date,format="%d/%m/%Y")
sub_data$DateTime <- as.POSIXct(paste(sub_data$Date, sub_data$Time))

png("plot3.png", width = 480, height = 480)
plot(sub_data$DateTime, sub_data$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(sub_data$DateTime, sub_data$Sub_metering_2, type="l", col="red")
lines(sub_data$DateTime, sub_data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()