# ensure appropriate dataframe available
source("CodeFlow.R")
# set png graphics device with required dimensions
png("plot3.png",width = 480,height = 480,units = "px")
# create empty plotting canvas
plot(reqData[,1],reqData[,6],xlab="", ylab="Energy sub metering", type="n")
# add lines from approriate data, set colors
lines(reqData[,1],reqData[,6])
lines(reqData[,1],reqData[,7],col="red")
lines(reqData[,1],reqData[,8],col="blue")
# create legend
legend("topright", legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"),col=c("black","red","blue"),lty=c(1,1))
# turn off graphics device
dev.off()