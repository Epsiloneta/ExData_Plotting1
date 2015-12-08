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

### PLOT 1
png('plot1.png')
hist(data1$Global_active_power,xlab = "Global Active Power (kilowatts)", ylab="Frequency", 
     main="Global Active Power",col="red")
# save to png
#dev.copy(png,"plot1.png")
dev.off()

### PLOT 2
## Change language labels
Sys.setlocale(locale="en_US.utf8")
png('plot2.png')
plot(data1$times,data1$Global_active_power, type = "l",xlab="",
     ylab = "Global Active Power (kilowatts)")
# save to png
#dev.copy(png,"plot2.png")
dev.off()

