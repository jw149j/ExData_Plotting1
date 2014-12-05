# ensure appropriate dataframe available
source("CodeFlow.R")
# set png graphics device with required dimensions
png("plot2.png",width = 480,height = 480,units = "px")
# create empty plotting canvas
plot(reqData[,1],reqData[,2],xlab="", ylab="Global active Power (kilowatts)", type="n")
# add line from approriate data
lines(reqData[,1],reqData[,2])
# turn off graphics device
dev.off()