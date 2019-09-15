zip_file<-file.choose()
output_directory<-'C:/Jonathan'
unzip(zip_file,exdir=output_directory)
setwd(output_directory)

data<-read.table('household_power_consumption.txt',sep=';',header=TRUE,quote="",na.strings = "?")
sub_data<-data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
sub_data$Date<-as.Date(sub_data$Date,format="%d/%m/%Y")
png("plot1.png",width = 480,height = 480)
hist(sub_data$Global_active_power,type="l",main="Global Active Power",col="red",ylab = "Frequency",xlab="Global Active Power(kilowatts)")
dev.off()