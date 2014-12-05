# ensure appropriate dataframe available
source("CodeFlow.R")
# set png graphics device with required dimensions
png("plot4.png",width = 480,height = 480,units = "px")
# define a multiple plot - 2cols x 2rows
par(mfcol = c(2, 2))
# 1st plot - set empty frame
plot(reqData[,1],reqData[,2],xlab="", ylab="Global active Power (kilowatts)", type="n")
# add line as appropriate
lines(reqData[,1],reqData[,2])
# 2nd plot - set empty frame
plot(reqData[,1],reqData[,6],xlab="", ylab="Energy sub metering", type="n")
# add lines as appropriate, set color
lines(reqData[,1],reqData[,6])
lines(reqData[,1],reqData[,7],col="red")
lines(reqData[,1],reqData[,8],col="blue")
# construct and add legend
legend("topright", legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"),col=c("black","red","blue"),lty=c(1,1), bty = "n")
# 3rd plot - set empty frame
plot(reqData[,1],reqData[,4],xlab="datetime", ylab="Voltage", type="n")
# add line as appropriate
lines(reqData[,1],reqData[,4])
# 4th plot - set empty frame
plot(reqData[,1],reqData[,3],xlab="datetime", ylab="Global_reactive_power", type="n")
# add line as appropriate
lines(reqData[,1],reqData[,3])
# turn off graphics device
dev.off()