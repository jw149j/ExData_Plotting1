# ensure appropriate dataframe available
source("CodeFlow.R")
# set png graphics device with required dimensions
png("plot1.png",width = 480,height = 480,units = "px")
# plot histogram 
hist(reqData[,2],col="red",xlab = "Global active Power (kilowatts)",main = "Global Active Power")
# turn off graphics device
dev.off()
