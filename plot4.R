# load data
data = read.csv("household_power_consumption.txt",sep=";", na.strings = "?",
                stringsAsFactors = FALSE)  # read text file 
# volem fer servir strptime per poder ordenar les dates i hores
x=data$Date
y=data$Time
##
days=strptime(x, "%d/%m/%Y")
hours=strptime(y, "%H:%M:%S")
data$days=days
data$hours=hours

xx = paste(x, y)
times=strptime(xx, "%d/%m/%Y %H:%M:%S")
data$times=times
## selecting data rows
data1=with(data, data[(days >= "2007-02-01" & days <= "2007-02-02"),])

### PLOT 4
## Change language labels
Sys.setlocale(locale="en_US.utf8")

png('plot4.png')
par(mfrow=c(2,2))
##1
plot(data1$times,data1$Global_active_power, type = "l",xlab="",
     ylab = "Global Active Power")
##2
plot(data1$times,data1$Voltage, type = "l",xlab="datetime",
     ylab = "Voltage")
##3
plot(data1$times,data1$Sub_metering_1, type = "l",xlab="",
     ylab = "Energy sub metering")
lines(data1$times,data1$Sub_metering_2,col="red")
lines(data1$times,data1$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1,bty="n")
##4
plot(data1$times,data1$Global_reactive_power, type = "l",ylab="Global_reactive_power",
     xlab = "datetime")
# save to png
dev.off()